"""
A utility to aid in ensuring that external URLs mentioned in the project are
archived in the Internet Archive WayBack machine.

Besides the below behavior, it also accepts a --log-file option to log
to a file instead of stderr.

$ python check_urls.py url_archive_status.json add-urls --ignore ignored_url_patterns.json foo.md bar.html baz.fsh

   Adds all absolute URLs to archive_status.json unless they match a regular
   expression in ignored_url_patterns.json. The URLs are added with a status
   of "Unknown".

$ python check_urls.py url_archive_status.json fail-if-would-add --ignore ignored_url_patterns.json foo.md bar.html baz.fsh

   Fails if the add-urls command with the same arguments would add
   URLs to archive_status.json.

$ python check_urls.py url_archive_status.json check --cred credentials.json

   TODO: currently ignores the credentials and does not check the status of
           capture jobs.

   Every URL in archive_status.json with a status of "Unknown" is checked to
   see if it is stored in the Internet Archive WayBack machine as long as it
   hasn't been checked in the last day. It also checks the capture status of
   every URL with a status of "Submitted" as long as the most recent check
   is within the last day.

   If a URL is found to be archived, its status is changed to "Archived".

   If there is an error, the status remains unchanged.

   In both cases, the last check time is updated.

   credentials.json should contain the access key and secret for the
   Save Page Now 2 API. These are needed to check the status of capture
   jobs.

$ python check_urls.py url_archive_status.json list-unarchived

   Lists all URLs in archive_status.json with a status of "Unknown",
   "Submitted", or "Submission Failed"

$ python check_urls.py url_archive_status.json submit --cred credentials.json

   Submits all URLs in archive_status.json with a status of "Unknown" to the
   Internet Archive WayBack machine.

   credentials.json should contain the access key and secret for the
   Save Page Now 2 API.

   On success, the status is changed to "Submitted" and the job ID is recorded
   to allow for job status requests.

   If the submission job fails

   On an error, the entry is left unchanged.
"""

import logging
import re
from collections.abc import Iterable, Callable
from dataclasses import dataclass, asdict
from datetime import datetime, timedelta
from enum import Enum
from pathlib import Path
import argparse
import sys
from re import Pattern
from typing import NewType, IO, Any
import json
from requests_ratelimiter import LimiterSession

import markdown
from bs4 import BeautifulSoup


class SubCommand(Enum):
    """A sub-command chosen from the command line."""

    ADD_URLS = "add-urls"
    FAIL_IF_WOULD_ADD = "fail-if-would-add"
    CHECK = "check"
    LIST_UNARCHIVED = "list-unarchived"
    SUBMIT = "submit"


@dataclass
class Args:
    """The command line arguments.

    Attributes:
        archive_status_file: The path to the JSON file containing the archive
           status for all known URLs.
        subcommand: The sub-command to execute.
        ignore_file: The path to the JSON file containing regular expressions
           to ignore URLs.
        log_file: The path to the log file.
        verbose: Enable verbose logging if true (DEBUG), normal logging
           otherwise (INFO).
        files: The files to process for commands that require them.
    """

    archive_status_file: Path
    subcommand: SubCommand
    ignore_file: Path | None
    log_file: Path | None
    verbose: bool
    files: list[Path]
    credentials: Path | None
    requests_per_second: float = 1.0


def parse_args() -> Args:
    """Return the parsed the command line arguments."""
    parser = argparse.ArgumentParser(
        description="Check URLs in files and archive status."
    )
    parser.add_argument(
        "archive_status_file", type=Path, help="Path to archive status JSON file."
    )
    parser.add_argument(
        "subcommand",
        type=str,
        choices=[sc.value for sc in SubCommand],
        help="Subcommand to execute.",
    )
    parser.add_argument(
        "files",
        nargs="*",
        type=Path,
        help="Files to process. Must be HTML, FSH, or Markdown.",
    )
    parser.add_argument(
        "--ignore", dest="ignore_file", type=Path, help="Path to ignore file."
    )
    parser.add_argument(
        "--log-file", dest="log_file", type=Path, help="Path to log file."
    )
    parser.add_argument(
        "--verbose", action="store_true", help="Enable verbose logging."
    )
    parser.add_argument(
        "--cred",
        "--credentials",
        dest="credentials",
        type=Path,
        help="Path to credentials file.",
    )
    parser.add_argument(
        "--requests-per-second",
        type=float,
        default=1.0,
        help="Number of requests per second for API calls (default: 1)",
    )
    args = parser.parse_args()

    subcmd = SubCommand(args.subcommand)
    # Require credentials for submit and check subcommands
    if (
        subcmd in {SubCommand.SUBMIT, SubCommand.CHECK}
        and getattr(args, "credentials", None) is None
    ):
        if subcmd == SubCommand.SUBMIT:
            # TODO: When we enable checking of submitted jobs, remove this if
            #       and require credentials for CHECK commands as well.
            parser.error(
                f"--cred/--credentials is required for '{subcmd.value}' subcommand."
            )

    # Extension check for add-urls and fail-if-would-add
    if subcmd in {SubCommand.ADD_URLS, SubCommand.FAIL_IF_WOULD_ADD}:
        allowed_exts = {".md", ".fsh", ".htm", ".html"}
        for file in args.files:
            if file.suffix.lower() not in allowed_exts:
                parser.error(
                    f"File '{file}' has disallowed extension '{file.suffix}'. Allowed extensions: {', '.join(allowed_exts)}."
                )

    return Args(
        archive_status_file=args.archive_status_file,
        subcommand=subcmd,
        ignore_file=getattr(args, "ignore_file", None),
        log_file=getattr(args, "log_file", None),
        verbose=args.verbose,
        files=args.files,
        credentials=getattr(args, "credentials", None),
        requests_per_second=args.requests_per_second,
    )


class Status(Enum):
    """A status for URLs."""

    UNKNOWN = "Unknown"
    SUBMITTED = "Submitted"
    SUBMISSION_FAILED = "Submission Failed"
    ARCHIVED = "Archived"


@dataclass
class UnknownStatus:
    """A status for URLs that are unknown.

    last_check: The last time the URL was checked. (None if never checked.)
    status: The status of the URL - used to ease JSON serialization.
    """

    last_check: datetime | None
    status: str = Status.UNKNOWN.value


@dataclass
class ArchivedStatus:
    """A status for URLs that are archived.

    Attributes:
        last_check: The last time the URL was checked.
        status: The status of the URL - used to ease JSON serialization.
    """

    last_check: datetime
    status: str = Status.ARCHIVED.value


@dataclass
class SubmittedStatus:
    """A status for URLs that have been submitted to
    the Internet Archive WayBack machine but whose job has not yet completed.

    Attributes:
        last_check: The last time the URL was checked.
        job_id: The ID of the capture job.
        status: The status of the URL - used to ease JSON serialization.
    """

    last_check: datetime
    job_id: str
    status: str = Status.SUBMITTED.value


@dataclass
class SubmissionFailedStatus:
    """A status for URLs that have failed to submit to
    the Internet Archive WayBack machine but whose job completed with
    an error.

    Attributes:
        last_check: The last time the URL was checked.
        job_id: The ID of the failed capture job.
        response: The response from the failed capture job that confirmed
           the failure. It will be in JSON format.
        status: The status of the URL - used to ease JSON serialization.
    """

    last_check: datetime
    job_id: str
    response: str
    status: str = Status.SUBMISSION_FAILED.value


UrlStatus = UnknownStatus | ArchivedStatus | SubmittedStatus | SubmissionFailedStatus

URL = NewType("URL", str)
StatusDict = dict[URL, UrlStatus]


class ErrorCode(Enum):
    """An error code. Details will be written to logs"""

    SUCCESS = 0
    INVALID_ARGS = 2
    FILE_ERROR = 3
    JSON_ERROR = 4
    BAD_LAST_CHECK_TIME = 7
    BAD_STATUS_DICT = 8
    NOT_A_FILE = 9
    WOULD_ADD_URLS = 10


def _status_to_dict(status: UrlStatus) -> dict:
    """Return a dict representation of a URL status.

    This dict could be converted back using _status_from_dict.
    """
    d = asdict(status)
    last_check: datetime | None = getattr(status, "last_check", None)
    if isinstance(last_check, datetime):
        d["last_check"] = d["last_check"].isoformat()
    return d


def _datetime_from_str(s: str | None) -> datetime | ErrorCode | None:
    """Return s as a datetime or return an error code. Will not raise.

    If s is None, return None.
    """
    if s is None:
        return None
    try:
        # If it works, we're not worried whether s was a str
        return datetime.fromisoformat(s)
    except ValueError:
        logging.error("Invalid last_check time: %s", s)
        return ErrorCode.BAD_LAST_CHECK_TIME


def _status_from_dict(d: dict) -> UrlStatus | ErrorCode:
    """Load a URL status from a dict. Will not raise."""
    logging.debug("Loading status from dict: %s", d)
    status_type = d.get("status")
    last_check = _datetime_from_str(d.get("last_check"))
    if isinstance(last_check, ErrorCode):
        return last_check
    if status_type == Status.UNKNOWN.value:
        return UnknownStatus(last_check=last_check)
    if last_check is None:
        logging.error("Missing last_check time for status: %s", status_type)
        return ErrorCode.BAD_LAST_CHECK_TIME
    if status_type == Status.ARCHIVED.value:
        return ArchivedStatus(last_check=last_check)
    if status_type == Status.SUBMITTED.value:
        return SubmittedStatus(last_check=last_check, job_id=d["job_id"])
    if status_type == Status.SUBMISSION_FAILED.value:
        return SubmissionFailedStatus(
            last_check=last_check, job_id=d["job_id"], response=d["response"]
        )
    return ErrorCode.BAD_STATUS_DICT


def load_statuses(serialized_statuses: IO[str]) -> StatusDict | ErrorCode:
    """Load the URL statuses from ``serialized_statuses``."""
    filename = getattr(serialized_statuses, "name", "<unknown>")
    logging.info("Loading statuses from file: %s", filename)
    try:
        data = json.load(serialized_statuses)
    except json.JSONDecodeError:
        return ErrorCode.JSON_ERROR
    except TypeError:
        return ErrorCode.NOT_A_FILE
    statuses: StatusDict = {}
    for url, status_dict in data.items():
        result = _status_from_dict(status_dict)
        if isinstance(result, ErrorCode):
            return result
        statuses[URL(url)] = result
    return statuses


def save_statuses(dest: IO[str], statuses: StatusDict) -> ErrorCode | None:
    """Write the URL statuses to ``dest`` in JSON format."""
    filename = getattr(dest, "name", "<unknown>")
    logging.info("Saving statuses to file: %s", filename)
    data = {str(url): _status_to_dict(status) for url, status in statuses.items()}
    # noinspection PyBroadException
    try:
        # noinspection PyTypeChecker
        json.dump(data, dest, indent=2, sort_keys=True)
        return None
    except Exception:
        logging.exception('Error writing statuses to file "%s"', filename)
        return ErrorCode.JSON_ERROR


def _pat(x: Any) -> Pattern | None:
    """Return a Pattern object corresponding to x or None on error.

    Intended for when x is a string holding a regular expression.
    """
    # noinspection PyBroadException
    try:
        return re.compile(str(x))
    except Exception:
        logging.exception('Failed to compile regex "%s"', x)
        return None


def read_ignore_file(ignore_file: Path | None) -> list[Pattern]:
    """Read ignore regexes from a JSON file. Returns a list of regex strings."""
    logging.info("Reading ignore file: %s", ignore_file)
    if ignore_file is None:
        logging.debug("No ignore file specified.")
        return []
    # noinspection PyBroadException
    try:
        with ignore_file.open("r") as f:
            s = f.read()
            data = json.loads(s)
    except Exception:
        logging.exception('Failed to read ignore file "%s"', ignore_file)
        return []

    if not isinstance(data, list):
        logging.debug("Ignore file is not a list.")
        return []
    maybe_pats = (_pat(x) for x in data)
    return [p for p in maybe_pats if p is not None]


def extract_urls_from_fsh(file: Path) -> list[str]:
    """Extract URLs from a FHIR shorthand (FSH) file.

    Uses a simple regular expression to find URLs, so might miss some."""
    url_pattern = re.compile("(https?://[^\")'\t\n| ]+)")
    # noinspection PyBroadException
    try:
        with file.open("r") as f:
            matches = filter(bool, (url_pattern.search(line) for line in f))
            return [match.group(1) for match in matches]
    except Exception:
        logging.exception('Failed to read FSH file "%s"', file)
        return []


def extract_urls_from_soup(soup: BeautifulSoup) -> list[str]:
    """Extract URLs from a BeautifulSoup object."""
    urls = set()
    # Extract from <a href>
    for tag in soup.find_all("a", href=True):
        urls.add(tag["href"])
    # Extract from <img src>
    for tag in soup.find_all("img", src=True):
        urls.add(tag["src"])
    # Extract from <link href>
    for tag in soup.find_all("link", href=True):
        urls.add(tag["href"])
    # Extract from <script src>
    for tag in soup.find_all("script", src=True):
        urls.add(tag["src"])
    # Only keep http/https URLs
    # noinspection HttpUrlsUsage
    return [u for u in urls if u.startswith("http://") or u.startswith("https://")]


def extract_urls_from_html(file: Path) -> list[str]:
    """Extract URLs from an HTML"""
    # noinspection PyBroadException
    try:
        with file.open("r") as f:
            soup = BeautifulSoup(f, "html.parser")
    except Exception:
        logging.exception('Failed to read HTML file "%s"', file)
        return []

    return extract_urls_from_soup(soup)


def extract_urls_from_md(file: Path) -> list[str]:
    """Extract URLs from a Markdown file (http/https only)."""
    # noinspection PyBroadException
    try:
        with file.open("r") as f:
            html = markdown.markdown(f.read())
        soup = BeautifulSoup(html, "html.parser")
    except Exception:
        logging.exception('Failed to read Markdown file "%s"', file)
        return []

    return extract_urls_from_soup(soup)


def _call_on_missing_for_missing_urls(
    statuses: StatusDict,
    files: list[Path],
    ignore_file: Path | None,
    on_missing: Callable[[StatusDict, Iterable[URL]], ErrorCode],
) -> ErrorCode:
    """Find the URLs that are missing from statuses and call on_missing.

    Args:
        statuses: The statuses to update. Will be modified.
        files: The files to process. Must be HTML, FSH, or Markdown
          where the type is determined by the file extension.
        ignore_file: The path to the JSON file containing regular expressions
          to ignore URLs.
        on_missing: A function that takes the statuses and the missing URLs
          and returns an ErrorCode. If the returned ErrorCode is not SUCCESS,
          _call_for_missing_urls will immediately return that ErrorCode.
          Otherwise, it will continue to process the remaining files and
          URLs. ``on_missing`` may update ``statuses``. The collection of
          missing URLs may be empty.
    """
    ignore_regexes = read_ignore_file(ignore_file)

    def is_included(s: str) -> bool:
        return not any(r.match(s) for r in ignore_regexes)

    extractors = {
        ".html": extract_urls_from_html,
        ".htm": extract_urls_from_html,
        ".md": extract_urls_from_md,
        ".fsh": extract_urls_from_fsh,
    }
    for file in files:
        logging.debug('Adding URLs from: "%s"', file)
        extractor = extractors.get(file.suffix.lower())
        if not extractor:
            logging.error(
                'Ignoring unrecognized file type: "%s" from "%s"', file.suffix, file
            )
            continue

        urls = map(lambda s: URL(s), filter(is_included, extractor(file)))
        missing = filter(lambda u: u not in statuses, urls)
        rv = on_missing(statuses, missing)
        if rv != ErrorCode.SUCCESS:
            return rv
    return ErrorCode.SUCCESS


def add_urls_on_missing(statuses: StatusDict, missing: Iterable[URL]) -> ErrorCode:
    """Callback to execute the add-urls subcommand.

    Adds all the URLs in missing to statuses as unknown and then
    returns ErrorCode.SUCCESS.
    """
    for url in missing:
        logging.debug('Adding URL: "%s"', url)
        statuses[url] = UnknownStatus(last_check=None)
    return ErrorCode.SUCCESS


def return_error_on_missing(
    _ignored_statuses: StatusDict, missing: Iterable[URL]
) -> ErrorCode:
    """Callback to execute the fail-if-would-add subcommand.

    Return ErrorCode.SUCCESS if missing is empty, otherwise return
    ErrorCode.WOULD_ADD_URLS
    """
    for url in missing:
        logging.error("Missing URL: %s", url)
        return ErrorCode.WOULD_ADD_URLS
    return ErrorCode.SUCCESS  # missing is empty


def add_urls(
    statuses: StatusDict, files: list[Path], ignore_file: Path | None
) -> ErrorCode:
    """Execute the add-urls subcommand.

    Args:
        statuses: The statuses to update. Will be modified.
        files: The files to process. Must be HTML, FSH, or Markdown
          where the type is determined by the file extension.
        ignore_file: The path to the JSON file containing regular expressions
          to ignore URLs.
    """
    return _call_on_missing_for_missing_urls(
        statuses, files, ignore_file, add_urls_on_missing
    )


def fail_if_would_add(
    statuses: StatusDict, files: list[Path], ignore_file: Path | None
) -> ErrorCode:
    """Execute the fail-if-would-add subcommand."""
    return _call_on_missing_for_missing_urls(
        statuses, files, ignore_file, return_error_on_missing
    )


AVAIL_API_URL = "https://archive.org/wayback/available"


def check(statuses: StatusDict, requests_per_second: float) -> ErrorCode:
    """Execute the check subcommand using Wayback Availability API."""
    logging.warning("Currently does not check the status of capture jobs.")
    logging.info("Checking URLs.")
    session = LimiterSession(per_second=requests_per_second)
    # Only check URLs that were never checked or last_check > 1 day ago
    one_day_ago = datetime.now().astimezone() - timedelta(days=1)
    urls_to_check = (
        url
        for url, status in statuses.items()
        if isinstance(status, UnknownStatus)
        and (status.last_check is None or status.last_check < one_day_ago)
    )
    num_checked = 0
    for url in urls_to_check:
        num_checked += 1
        # noinspection PyBroadException
        try:
            logging.debug('Checking URL: "%s"', url)
            resp = session.get(AVAIL_API_URL, params={"url": url})
            resp.raise_for_status()
            data = resp.json()
        except Exception:
            logging.exception("Error checking URL: %s", url)
            statuses[url].last_check = datetime.now()
            continue
        is_archived = (
            data.get("archived_snapshots", {})
            .get("closest", {})
            .get("available", False)
        )
        now = datetime.now().astimezone()
        if is_archived:
            logging.debug('Marking URL "%s" as archived.', url)
            statuses[url] = ArchivedStatus(last_check=now)
        else:
            logging.debug('Updating check time for URL "%s".', url)
            statuses[url].last_check = now
    logging.info("Checked %d URLs.", num_checked)
    return ErrorCode.SUCCESS


def list_unarchived(statuses: StatusDict) -> ErrorCode:
    """Execute the list-unarchived subcommand."""
    unarchived_statuses = {
        Status.UNKNOWN.value,
        Status.SUBMITTED.value,
        Status.SUBMISSION_FAILED.value,
    }
    for url, status in statuses.items():
        if getattr(status, "status", None) in unarchived_statuses:
            print(url)
    return ErrorCode.SUCCESS


def submit(statuses: StatusDict, credentials: Path) -> ErrorCode:
    """Execute the "submit" subcommand."""
    # TODO: implement submit logic
    return ErrorCode.SUCCESS


def save_on_success(
    statuses: StatusDict, dest: Path, error_code: ErrorCode
) -> ErrorCode:
    """Save statuses if error_code is SUCCESS, otherwise return error_code."""
    if error_code != ErrorCode.SUCCESS:
        return error_code

    # noinspection PyBroadException
    try:
        with dest.open("w") as f:
            save_result = save_statuses(f, statuses)
    except Exception:
        logging.exception('Failed to save archive status file "%s".', dest)
        return ErrorCode.FILE_ERROR

    if save_result is None:
        return ErrorCode.SUCCESS

    logging.error("Error saving statuses: %s", save_result)
    return save_result


def main() -> ErrorCode:
    """Check the URLs according to the command line arguments.

    Return an ErrorCode."""
    args = parse_args()
    # Set up logging
    log_level = logging.DEBUG if args.verbose else logging.INFO
    # noinspection SpellCheckingInspection
    logging.basicConfig(
        filename=str(args.log_file) if args.log_file else None,
        level=log_level,
        format="%(asctime)s %(levelname)s %(message)s",
    )
    # Load statuses
    stat_path = args.archive_status_file
    # noinspection PyBroadException
    try:
        with stat_path.open("r") as f:
            statuses_or_error = load_statuses(f)
    except FileNotFoundError:
        logging.warning(
            'Archive status file "%s" not found. Treating as empty.', stat_path
        )
        statuses_or_error = {}
    except Exception:
        logging.exception('Failed to open archive status file "%s"', stat_path)
        return ErrorCode.FILE_ERROR
    if isinstance(statuses_or_error, ErrorCode):
        logging.error("Error loading statuses: %s", statuses_or_error)
        return statuses_or_error
    statuses = statuses_or_error
    # Dispatch to subcommand
    if args.subcommand == SubCommand.ADD_URLS:
        return save_on_success(
            statuses, stat_path, add_urls(statuses, args.files, args.ignore_file)
        )
    if args.subcommand == SubCommand.FAIL_IF_WOULD_ADD:
        return fail_if_would_add(statuses, args.files, args.ignore_file)
    if args.subcommand == SubCommand.CHECK:
        return save_on_success(
            statuses, stat_path, check(statuses, args.requests_per_second)
        )
    if args.subcommand == SubCommand.LIST_UNARCHIVED:
        return list_unarchived(statuses)
    if args.subcommand == SubCommand.SUBMIT:
        return save_on_success(statuses, stat_path, submit(statuses, args.credentials))
    logging.error("Unknown subcommand: %s", args.subcommand)
    return ErrorCode.INVALID_ARGS


if __name__ == "__main__":
    sys.exit(main().value)
