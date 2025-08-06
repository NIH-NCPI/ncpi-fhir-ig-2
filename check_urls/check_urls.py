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

$ python check_urls.py url_archive_status.json check

   Every URL in archive_status.json with a status of "Unknown" is checked to
   see if it is stored in the Internet Archive WayBack machine as long as it
   hasn't been checked in the last day. It also checks the capture status of
   every URL with a status of "Submitted" as long as the most recent check
   is within the last day.

   If a URL is found to be archived, its status is changed to "Archived".

   If there is an error, the status remains unchanged.

   In both cases, the last check time is updated.

$ python check_urls.py url_archive_status.json list-unarchived

   Lists all URLs in archive_status.json with a status of "Unknown" or
   "Submitted".

$ python check_urls.py url_archive_status.json submit

   Submits all URLs in archive_status.json with a status of "Unknown" to the
   Internet Archive WayBack machine.

   On success, the status is changed to "Submitted" and the job ID is recorded
   to allow for job status requests.

   On an error, the entry is left unchanged.
"""
from dataclasses import dataclass
from enum import Enum
from pathlib import Path
import argparse
import sys

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

def parse_args() -> Args:
    """Return the parsed the command line arguments."""
    parser = argparse.ArgumentParser(description="Check URLs in files and archive status.")
    parser.add_argument("archive_status_file", type=Path, help="Path to archive status JSON file.")
    parser.add_argument("subcommand", type=str, choices=[sc.value for sc in SubCommand], help="Subcommand to execute.")
    parser.add_argument("files", nargs="*", type=Path, help="Files to process.")
    parser.add_argument("--ignore", dest="ignore_file", type=Path, help="Path to ignore file.")
    parser.add_argument("--log-file", dest="log_file", type=Path, help="Path to log file.")
    parser.add_argument("--verbose", action="store_true", help="Enable verbose logging.")
    args = parser.parse_args()
    return Args(
        archive_status_file=args.archive_status_file,
        subcommand=SubCommand(args.subcommand),
        ignore_file=getattr(args, "ignore_file", None),
        log_file=getattr(args, "log_file", None),
        verbose=args.verbose,
        files=args.files,
    )


def main() -> int:
    """Check the URLs according to the command line arguments.

    Return a Unix status code."""
    # TODO: implement main
    return 0

if __name__ == "__main__":
    sys.exit(main())