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
from dataclasses import dataclass
from datetime import datetime
from enum import Enum
from pathlib import Path
import argparse
import sys
from typing import TypedDict, NewType, IO


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

def parse_args() -> Args:
    """Return the parsed the command line arguments."""
    parser = argparse.ArgumentParser(description="Check URLs in files and archive status.")
    parser.add_argument("archive_status_file", type=Path, help="Path to archive status JSON file.")
    parser.add_argument("subcommand", type=str, choices=[sc.value for sc in SubCommand], help="Subcommand to execute.")
    parser.add_argument("files", nargs="*", type=Path, help="Files to process.")
    parser.add_argument("--ignore", dest="ignore_file", type=Path, help="Path to ignore file.")
    parser.add_argument("--log-file", dest="log_file", type=Path, help="Path to log file.")
    parser.add_argument("--verbose", action="store_true", help="Enable verbose logging.")
    parser.add_argument("--cred", "--credentials", dest="credentials", type=Path, help="Path to credentials file.")
    args = parser.parse_args()

    # Require credentials for submit and check subcommands
    subcmd = SubCommand(args.subcommand)
    if subcmd in {SubCommand.SUBMIT, SubCommand.CHECK} and getattr(args, "credentials", None) is None:
        parser.error(f"--cred/--credentials is required for '{subcmd.value}' subcommand.")

    return Args(
        archive_status_file=args.archive_status_file,
        subcommand=subcmd,
        ignore_file=getattr(args, "ignore_file", None),
        log_file=getattr(args, "log_file", None),
        verbose=args.verbose,
        files=args.files,
        credentials=getattr(args, "credentials", None),
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
    ERROR = 1
    INVALID_ARGS = 2
    FILE_ERROR = 3
    JSON_ERROR = 4
    URL_ERROR = 5
    UNHANDLED_EXCEPTION = 6

def load_statuses(serialized_statuses: IO[str]) -> StatusDict | ErrorCode:
    """Load the URL statuses from ``serialized_statuses``."""
    # TODO: implement load_statuses
    return {}

def save_statuses(dest: IO[str], statuses: StatusDict) -> ErrorCode | None:
    # TODO: implement save_statuses
    return None

def main() -> int:
    """Check the URLs according to the command line arguments.

    Return a Unix status code."""
    # TODO: implement main
    return 0

if __name__ == "__main__":
    sys.exit(main())