# check_urls.py

`check_urls.py` is a command-line utility for managing and checking the archival status of URLs referenced in files. It supports adding URLs, checking their status, listing unarchived URLs.

Originally, it was intended to allow automated checking and batch submission from our GitHub actions CI pipeline. But that is still unimplemented.

## Features

- **Add URLs**: Scan files and add discovered URLs to the status database.
- **Check URLs**: Check the archival status of URLs and update the database.
- **List Unarchived URLs**: Print URLs that have not yet been archived.
- **Ignore URLs**: Exclude specific URLs from processing using an ignore list.
- **Logging**: Detailed logs for troubleshooting and auditing.

## Installation / Setup

These instructions are for Linux.

Before running you need to:

- change to the directory containing
`check_urls.py`
- create, populate, and activate a virtual environment. (Requires Python 3.11 or later.)

```sh
python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip -r requirements.txt
```

## Usage

For someone working on the implementation guide, the tool is typically used in a sequence of steps to manually update the URL archive status:

### 1. Add URLs

Scan files for URLs and add them to the status database:

```sh
rm -f check_urls.log && find ../input \( -iname "*.fsh" -o -iname "*.html" -o -iname "*.md" -o -iname "*.htm" \) -exec python check_urls.py url_archive_status.json --log-file check_urls.log --ignore ignored_urls.json add-urls '{}' ';'
```

### 2. Check URLs

After adding URLs, check their archival status:

```sh
python check_urls.py url_archive_status.json --log-file check_urls.log check
```

It will only re-check URLs once per day to
reduce the load on the `archive.org` servers.

You should manually inspect the added urls
```sh
git diff
```

After editing and possibly updating ignored_urls.json you probably want to update the copy in the repository.

```sh
git add url_archive_status.json ignored_urls.json
git commit
```

### 3. List Unarchived URLs

Finally, list the URLs that have not yet been archived:

```sh
python check_urls.py url_archive_status.json list-unarchived
```

You can then copy them manually to the 
archive.org save page.

## Arguments

- `<status_file>`: Path to the JSON file storing URL statuses (e.g., `url_archive_status.json`).
- `--log-file <file>`: Path to the log file (e.g., `check_urls.log`).
- `--ignore <file>`: Path to the JSON file listing URLs to ignore (e.g., `ignored_urls.json`).
- `<subcommand>`: One of `add-urls`, `check`, `list-unarchived`, etc.

## Subcommands

- `add-urls <file>`: Add URLs found in the specified file.
- `check`: Check the archival status of all tracked URLs.
- `list-unarchived`: List URLs that are not yet archived.

## Requirements

- Python 3.11+
- See `requirements.txt` for dependencies.


