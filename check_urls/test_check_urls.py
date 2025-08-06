from unittest.mock import MagicMock

from check_urls import (
    main,
    parse_args,
    SubCommand,
    Args,
    _status_from_dict,
    Status,
    save_on_success,
)
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
    assert _status_from_dict(d) == ErrorCode.BAD_STATUS_DICT


def test_load_statuses_type_error():
    m = MagicMock()
    m.read.return_value = 123
    # noinspection PyTypeChecker
    assert load_statuses(m) == ErrorCode.NOT_A_FILE


def test_load_statuses_bad_status_dict():
    # Line 262: Should return ErrorCode.BAD_STATUS_DICT if status dict is bad
    # status dict with an unknown status type
    bad_data = '{"https://example.com": {"status": "NotAStatus", "last_check": "2024-01-01T00:00:00"}}'
    buf = io.StringIO(bad_data)
    assert load_statuses(buf) == ErrorCode.BAD_STATUS_DICT


def test__status_from_dict_bad_last_check_time():
    # Line 226: Should return ErrorCode.BAD_LAST_CHECK_TIME for invalid last_check

    d = {"status": "Unknown", "last_check": "not-a-date"}
    assert _status_from_dict(d) == ErrorCode.BAD_LAST_CHECK_TIME


def test__status_from_dict_missing_last_check():
    # Line 234: Should return ErrorCode.BAD_LAST_CHECK_TIME for missing last_check with non-Unknown status
    d = {"status": Status.ARCHIVED.value}
    assert _status_from_dict(d) == ErrorCode.BAD_LAST_CHECK_TIME


def test__status_from_dict_archived():
    # Line 239: Should return ArchivedStatus for valid archived status
    d = {"status": Status.ARCHIVED.value, "last_check": "2024-01-01T12:00:00"}
    result = _status_from_dict(d)
    assert isinstance(result, ArchivedStatus)
    assert result.last_check.year == 2024
    assert result.last_check.month == 1
    assert result.last_check.day == 1
    assert result.last_check.hour == 12


def make_args(
    subcommand,
    archive_status_file=None,
    files=None,
    ignore_file=None,
    log_file=None,
    verbose=False,
    credentials=None,
) -> Args:
    return Args(
        archive_status_file=archive_status_file or Path("status.json"),
        subcommand=subcommand,
        ignore_file=ignore_file,
        log_file=log_file,
        verbose=verbose,
        files=files or [],
        credentials=credentials,
    )


@pytest.fixture(autouse=True)
def patch_parse_args(monkeypatch):
    # Patch parse_args to be controlled by each test
    args = {}

    def fake_parse_args():
        return args["value"]

    monkeypatch.setattr(sys.modules["check_urls"], "parse_args", fake_parse_args)
    return args


@pytest.fixture(autouse=True)
def patch_logging(monkeypatch):
    monkeypatch.setattr(
        sys.modules["check_urls"].logging, "basicConfig", lambda **kwargs: None
    )
    monkeypatch.setattr(sys.modules["check_urls"].logging, "info", lambda *a, **k: None)
    monkeypatch.setattr(
        sys.modules["check_urls"].logging, "error", lambda *a, **k: None
    )
    monkeypatch.setattr(
        sys.modules["check_urls"].logging, "exception", lambda *a, **k: None
    )
    monkeypatch.setattr(
        sys.modules["check_urls"].logging, "debug", lambda *a, **k: None
    )


@pytest.fixture(autouse=True)
def patch_open(monkeypatch):
    monkeypatch.setattr(Path, "open", lambda self, mode="r": io.StringIO("{}"))


@pytest.fixture(autouse=True)
def patch_load_save(monkeypatch):
    monkeypatch.setattr(sys.modules["check_urls"], "load_statuses", lambda f: {})
    monkeypatch.setattr(sys.modules["check_urls"], "save_statuses", lambda f, s: None)


@pytest.mark.parametrize(
    "subcommand,handler",
    [
        (SubCommand.ADD_URLS, "add_urls"),
        (SubCommand.FAIL_IF_WOULD_ADD, "fail_if_would_add"),
        (SubCommand.CHECK, "check"),
        (SubCommand.LIST_UNARCHIVED, "list_unarchived"),
        (SubCommand.SUBMIT, "submit"),
    ],
)
def test_main_success(monkeypatch, patch_parse_args, subcommand, handler):
    patch_parse_args["value"] = make_args(
        subcommand,
        credentials=Path("cred.json")
        if subcommand in {SubCommand.CHECK, SubCommand.SUBMIT}
        else None,
    )
    for h in [
        "add_urls",
        "fail_if_would_add",
        "check",
        "list_unarchived",
        "submit",
    ]:
        monkeypatch.setattr(
            sys.modules["check_urls"], h, lambda *a, **k: ErrorCode.SUCCESS
        )
    assert main() == ErrorCode.SUCCESS


def test_main_save_error(monkeypatch, patch_parse_args):
    patch_parse_args["value"] = make_args(SubCommand.ADD_URLS)
    monkeypatch.setattr(
        sys.modules["check_urls"], "add_urls", lambda *a, **k: ErrorCode.SUCCESS
    )
    monkeypatch.setattr(
        sys.modules["check_urls"], "save_statuses", lambda f, s: ErrorCode.JSON_ERROR
    )
    assert main() == ErrorCode.JSON_ERROR


def test_main_load_error(monkeypatch, patch_parse_args):
    patch_parse_args["value"] = make_args(SubCommand.ADD_URLS)
    monkeypatch.setattr(
        sys.modules["check_urls"], "load_statuses", lambda f: ErrorCode.JSON_ERROR
    )
    assert main() == ErrorCode.JSON_ERROR


def test_main_file_open_error(monkeypatch, patch_parse_args):
    patch_parse_args["value"] = make_args(SubCommand.ADD_URLS)
    monkeypatch.setattr(
        Path, "open", lambda self, mode="r": (_ for _ in ()).throw(OSError("fail"))
    )
    assert main() == ErrorCode.FILE_ERROR


def test_main_invalid_subcommand(monkeypatch, patch_parse_args):
    class DummySubCommand:
        value = "dummy"

    patch_parse_args["value"] = make_args(DummySubCommand())
    assert main() == ErrorCode.INVALID_ARGS


IGNORED_P = Path("ignored.json")


def test_save_on_success_success(monkeypatch):
    statuses = {}
    monkeypatch.setattr(Path, "open", lambda self, mode="w": io.StringIO())
    monkeypatch.setattr(sys.modules["check_urls"], "save_statuses", lambda f, s: None)
    assert save_on_success(statuses, IGNORED_P, ErrorCode.SUCCESS) == ErrorCode.SUCCESS


def test_save_on_success_save_error(monkeypatch):
    statuses = {}
    monkeypatch.setattr(Path, "open", lambda self, mode="w": io.StringIO())
    monkeypatch.setattr(
        sys.modules["check_urls"], "save_statuses", lambda f, s: ErrorCode.JSON_ERROR
    )
    assert (
        save_on_success(statuses, IGNORED_P, ErrorCode.SUCCESS) == ErrorCode.JSON_ERROR
    )


def test_save_on_success_file_error(monkeypatch):
    statuses = {}
    monkeypatch.setattr(
        Path, "open", lambda self, mode="w": (_ for _ in ()).throw(OSError("fail"))
    )
    assert (
        save_on_success(statuses, IGNORED_P, ErrorCode.SUCCESS) == ErrorCode.FILE_ERROR
    )


def test_save_on_success_non_success(monkeypatch):
    statuses = {}
    assert (
        save_on_success(statuses, IGNORED_P, ErrorCode.JSON_ERROR)
        == ErrorCode.JSON_ERROR
    )
