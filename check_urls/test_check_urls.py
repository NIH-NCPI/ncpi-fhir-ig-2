from unittest.mock import MagicMock

from check_urls import main, parse_args, SubCommand
from pathlib import Path
import sys
import pytest
import io
from datetime import datetime
from check_urls import (
    UnknownStatus,
    ArchivedStatus,
    SubmittedStatus,
    SubmissionFailedStatus,
    URL,
    save_statuses,
    load_statuses,
    ErrorCode,
)


def test_main():
    assert main() == 0


def test_parse_args_basic(monkeypatch):
    test_args = [
        "check_urls.py",
        "status.json",
        "add-urls",
        "file1.md",
        "file2.html",
        "--ignore",
        "ignore.json",
        "--log-file",
        "log.txt",
        "--verbose",
    ]
    monkeypatch.setattr(sys, "argv", test_args)
    args = parse_args()
    assert args.archive_status_file == Path("status.json")
    assert args.subcommand == SubCommand.ADD_URLS
    assert args.ignore_file == Path("ignore.json")
    assert args.log_file == Path("log.txt")
    assert args.verbose is True
    assert args.files == [Path("file1.md"), Path("file2.html")]


def test_parse_args_add_urls(monkeypatch):
    test_args = ["check_urls.py", "status.json", "add-urls", "foo.md", "bar.html"]
    monkeypatch.setattr(sys, "argv", test_args)
    args = parse_args()
    assert args.subcommand == SubCommand.ADD_URLS
    assert args.files == [Path("foo.md"), Path("bar.html")]


def test_parse_args_fail_if_would_add(monkeypatch):
    test_args = [
        "check_urls.py",
        "status.json",
        "fail-if-would-add",
        "foo.md",
        "bar.html",
    ]
    monkeypatch.setattr(sys, "argv", test_args)
    args = parse_args()
    assert args.subcommand == SubCommand.FAIL_IF_WOULD_ADD
    assert args.files == [Path("foo.md"), Path("bar.html")]


def test_parse_args_list_unarchived(monkeypatch):
    test_args = ["check_urls.py", "status.json", "list-unarchived"]
    monkeypatch.setattr(sys, "argv", test_args)
    args = parse_args()
    assert args.subcommand == SubCommand.LIST_UNARCHIVED
    assert args.files == []


def test_parse_args_check_with_credentials(monkeypatch):
    test_args = ["check_urls.py", "status.json", "check", "--cred", "credentials.json"]
    monkeypatch.setattr(sys, "argv", test_args)
    args = parse_args()
    assert args.subcommand == SubCommand.CHECK
    assert args.credentials == Path("credentials.json")
    assert args.files == []


def test_parse_args_submit_with_credentials(monkeypatch):
    test_args = [
        "check_urls.py",
        "status.json",
        "submit",
        "--credentials",
        "credentials.json",
    ]
    monkeypatch.setattr(sys, "argv", test_args)
    args = parse_args()
    assert args.subcommand == SubCommand.SUBMIT
    assert args.credentials == Path("credentials.json")
    assert args.files == []


def test_parse_args_check_missing_credentials(monkeypatch):
    test_args = ["check_urls.py", "status.json", "check"]
    monkeypatch.setattr(sys, "argv", test_args)
    with pytest.raises(SystemExit) as e:
        parse_args()
    assert e.value.code != 0


def test_parse_args_submit_missing_credentials(monkeypatch):
    test_args = ["check_urls.py", "status.json", "submit"]
    monkeypatch.setattr(sys, "argv", test_args)
    with pytest.raises(SystemExit) as e:
        parse_args()
    assert e.value.code != 0


def make_status_dict():
    return {
        URL("https://example.com/unknown-no-check"): UnknownStatus(last_check=None),
        URL("https://example.com/unknown-has-check"): UnknownStatus(
            last_check=datetime(2024, 1, 1, 11, 0, 0)
        ),
        URL("https://example.com/archived"): ArchivedStatus(
            last_check=datetime(2024, 1, 1, 12, 0, 0)
        ),
        URL("https://example.com/submitted"): SubmittedStatus(
            last_check=datetime(2024, 1, 2, 13, 0, 0), job_id="job123"
        ),
        URL("https://example.com/failed"): SubmissionFailedStatus(
            last_check=datetime(2024, 1, 3, 14, 0, 0),
            job_id="job456",
            response='{"error":true}',
        ),
    }


def test_save_and_load_statuses():
    statuses = make_status_dict()
    buf = io.StringIO()
    err = save_statuses(buf, statuses)
    assert err is None
    buf.seek(0)
    loaded = load_statuses(buf)
    assert isinstance(loaded, dict)
    assert set(loaded.keys()) == set(statuses.keys())
    assert loaded == statuses
    assert isinstance(
        loaded[URL("https://example.com/unknown-no-check")], UnknownStatus
    )
    assert isinstance(
        loaded[URL("https://example.com/unknown-has-check")], UnknownStatus
    )
    assert loaded[URL("https://example.com/archived")].last_check == datetime(
        2024, 1, 1, 12, 0, 0
    )
    assert loaded[URL("https://example.com/submitted")].job_id == "job123"
    assert loaded[URL("https://example.com/failed")].response == '{"error":true}'


def test_load_statuses_invalid_json():
    buf = io.StringIO("not a json")
    result = load_statuses(buf)
    assert result == ErrorCode.JSON_ERROR


def test_save_statuses_io_error(monkeypatch):
    statuses = make_status_dict()

    class BadIO(io.StringIO):
        def write(self, s):
            raise IOError("fail")

    bad_buf = BadIO()
    err = save_statuses(bad_buf, statuses)
    assert err == ErrorCode.JSON_ERROR


def test__status_from_dict_bad_status_dict():
    # Line 245: Should return ErrorCode.BAD_STATUS_DICT for unknown status
    d = {"status": "NotAStatus", "last_check": "2024-01-01T00:00:00"}
    from check_urls import _status_from_dict, ErrorCode

    assert _status_from_dict(d) == ErrorCode.BAD_STATUS_DICT


def test_load_statuses_type_error():
    m = MagicMock()
    m.read.return_value = 123
    # noinspection PyTypeChecker
    assert load_statuses(m) == ErrorCode.NOT_A_FILE


def test_load_statuses_bad_status_dict():
    # Line 262: Should return ErrorCode.BAD_STATUS_DICT if status dict is bad
    import io
    from check_urls import load_statuses, ErrorCode

    # status dict with an unknown status type
    bad_data = '{"https://example.com": {"status": "NotAStatus", "last_check": "2024-01-01T00:00:00"}}'
    buf = io.StringIO(bad_data)
    assert load_statuses(buf) == ErrorCode.BAD_STATUS_DICT


def test__status_from_dict_bad_last_check_time():
    # Line 226: Should return ErrorCode.BAD_LAST_CHECK_TIME for invalid last_check
    from check_urls import _status_from_dict, ErrorCode

    d = {"status": "Unknown", "last_check": "not-a-date"}
    assert _status_from_dict(d) == ErrorCode.BAD_LAST_CHECK_TIME


def test__status_from_dict_missing_last_check():
    # Line 234: Should return ErrorCode.BAD_LAST_CHECK_TIME for missing last_check with non-Unknown status
    from check_urls import _status_from_dict, ErrorCode, Status

    d = {"status": Status.ARCHIVED.value}
    assert _status_from_dict(d) == ErrorCode.BAD_LAST_CHECK_TIME


def test__status_from_dict_archived():
    # Line 239: Should return ArchivedStatus for valid archived status
    from check_urls import _status_from_dict, ArchivedStatus, Status

    d = {"status": Status.ARCHIVED.value, "last_check": "2024-01-01T12:00:00"}
    result = _status_from_dict(d)
    assert isinstance(result, ArchivedStatus)
    assert result.last_check.year == 2024
    assert result.last_check.month == 1
    assert result.last_check.day == 1
    assert result.last_check.hour == 12
