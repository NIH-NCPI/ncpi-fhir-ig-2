from check_urls import main, parse_args, SubCommand
from pathlib import Path
import sys
import pytest

def test_main():
    assert main() == 0

def test_parse_args_basic(monkeypatch):
    test_args = [
        "check_urls.py",
        "status.json",
        "add-urls",
        "file1.md",
        "file2.html",
        "--ignore", "ignore.json",
        "--log-file", "log.txt",
        "--verbose"
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
    test_args = [
        "check_urls.py", "status.json", "add-urls", "foo.md", "bar.html"
    ]
    monkeypatch.setattr(sys, "argv", test_args)
    args = parse_args()
    assert args.subcommand == SubCommand.ADD_URLS
    assert args.files == [Path("foo.md"), Path("bar.html")]

def test_parse_args_fail_if_would_add(monkeypatch):
    test_args = [
        "check_urls.py", "status.json", "fail-if-would-add", "foo.md", "bar.html"
    ]
    monkeypatch.setattr(sys, "argv", test_args)
    args = parse_args()
    assert args.subcommand == SubCommand.FAIL_IF_WOULD_ADD
    assert args.files == [Path("foo.md"), Path("bar.html")]


def test_parse_args_list_unarchived(monkeypatch):
    test_args = [
        "check_urls.py", "status.json", "list-unarchived"
    ]
    monkeypatch.setattr(sys, "argv", test_args)
    args = parse_args()
    assert args.subcommand == SubCommand.LIST_UNARCHIVED
    assert args.files == []

def test_parse_args_check_with_credentials(monkeypatch):
    test_args = [
        "check_urls.py", "status.json", "check", "--cred", "credentials.json"
    ]
    monkeypatch.setattr(sys, "argv", test_args)
    args = parse_args()
    assert args.subcommand == SubCommand.CHECK
    assert args.credentials == Path("credentials.json")
    assert args.files == []

def test_parse_args_submit_with_credentials(monkeypatch):
    test_args = [
        "check_urls.py", "status.json", "submit", "--credentials", "credentials.json"
    ]
    monkeypatch.setattr(sys, "argv", test_args)
    args = parse_args()
    assert args.subcommand == SubCommand.SUBMIT
    assert args.credentials == Path("credentials.json")
    assert args.files == []

def test_parse_args_check_missing_credentials(monkeypatch):
    test_args = [
        "check_urls.py", "status.json", "check"
    ]
    monkeypatch.setattr(sys, "argv", test_args)
    with pytest.raises(SystemExit) as e:
        parse_args()
    assert e.value.code != 0

def test_parse_args_submit_missing_credentials(monkeypatch):
    test_args = [
        "check_urls.py", "status.json", "submit"
    ]
    monkeypatch.setattr(sys, "argv", test_args)
    with pytest.raises(SystemExit) as e:
        parse_args()
    assert e.value.code != 0
