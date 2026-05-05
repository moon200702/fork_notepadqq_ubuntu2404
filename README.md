可以，這版我重新整理成**可直接整份貼到 README.md** 的完整 Markdown。
重點放在：個人 fork、非官方、Codex/AI 協助、保留 upstream attribution、Ubuntu 24.04 / Qt 5.15.x compatibility、目前 experimental、不誇大穩定性。

````markdown
# Notepadqq Ubuntu 24.04 Compatibility Fork

> Unofficial personal fork of [notepadqq/notepadqq](https://github.com/notepadqq/notepadqq).

This repository is a personal compatibility fork of Notepadqq.

The purpose of this fork is to experiment with rebuilding, testing, and adapting Notepadqq for:

- Ubuntu 24.04
- Qt 5.15.x
- Notepad++ / Notepadqq-like basic editing experience
- safer validation for infrastructure-oriented text editing workflows

This fork is **not** an official Notepadqq release.

This fork is **not affiliated with, endorsed by, or maintained by the original Notepadqq maintainers**.

The original Notepadqq project is no longer actively maintained, and newer OS / Qt versions may have compatibility or runtime stability issues. This fork keeps that context visible and treats compatibility, runtime stability, and data correctness as active testing areas.

---

## Fork status

This fork is currently **experimental**.

| Area | Status |
|---|---|
| Ubuntu 24.04 build | Testing |
| Qt 5.15.x compatibility | Testing |
| Runtime smoke test | In progress |
| Data-correctness test | In progress |
| Production readiness | Not ready |
| Release package | Not provided |

Recommended use:

- Testing
- Local experimentation
- Compatibility investigation
- Notepadqq migration research
- Learning and reviewing AI-assisted code changes

Not recommended yet:

- Editing critical infrastructure files as the only editor
- Editing important files without backup
- Large-scale search and replace on important files
- Production use
- Claiming this fork is stable

---

## Why this fork exists

Notepadqq provides a familiar Notepad++-like editing experience on Linux, but the upstream project is no longer actively maintained.

This fork exists to explore whether Notepadqq can be made usable again on a modern Ubuntu desktop environment, especially Ubuntu 24.04 with Qt 5.15.x.

The goal is not to redesign Notepadqq into a new IDE.

The goal is to preserve the original lightweight editor experience while making the build, runtime behavior, and basic file-editing correctness easier to verify.

---

## AI-assisted development notice

This fork is maintained as a personal learning and compatibility experiment.

Some changes in this fork may be created or assisted with AI coding tools, including OpenAI Codex.

AI-assisted changes should still follow normal open-source expectations:

- Changes should be reviewed before merging.
- Build and runtime behavior should be tested.
- Data-correctness risks should be documented.
- Generated code should not remove existing license notices.
- Generated code should not introduce unclear ownership or licensing problems.
- Changes should remain small, auditable, and explainable.

AI assistance does not replace human review.

---

## Project priorities

This fork prioritizes:

1. **Data correctness**
2. **Runtime stability**
3. **Reproducible builds**
4. **Minimal behavior changes**
5. **Preserving Notepadqq / Notepad++-like user experience**

For infrastructure-oriented text editing, the most important risks are not visual design issues. The important risks are:

- Save failure
- Silent overwrite
- External file changes being ignored
- Line ending changes
- Encoding changes
- Unicode whitespace changes
- Broken search and replace
- Crash during editing
- UI showing a save as successful when it actually failed

This fork should not be considered reliable for important files until these areas are tested.

---

## Goals

Current goals:

- Build Notepadqq on Ubuntu 24.04
- Verify the actual Qt 5 version used by the build environment
- Preserve existing Notepadqq behavior where possible
- Keep Notepad++-like default shortcuts and editing workflow
- Improve Ubuntu 24.04 build documentation
- Add reproducible build notes
- Add smoke-test procedures
- Investigate runtime crash risks
- Investigate data-correctness risks

---

## Non-goals

This fork does not currently aim to:

- Become the official Notepadqq project
- Replace the upstream Notepadqq maintainers
- Redesign the editor UI
- Migrate to Qt 6 in the first phase
- Become a full IDE
- Add a plugin ecosystem
- Claim production stability before testing evidence exists

---

## Relationship to upstream

Upstream project:

- <https://github.com/notepadqq/notepadqq>

This fork preserves the original project history, license, and attribution.

The upstream project remains the original source of Notepadqq. This repository is only a personal compatibility fork focused on Ubuntu 24.04 / Qt 5.15.x testing.

---

## License

This project is a fork of Notepadqq and remains licensed under the GNU General Public License v3.0.

Original project:

- <https://github.com/notepadqq/notepadqq>

Original license:

- GPL-3.0

Copyright notices from the original project are preserved.

Modifications in this fork are documented through Git history.

---

## Build from source

This fork currently does **not** provide release packages.

Please build from source for testing.

### Get the source

```bash
git clone --recursive https://github.com/moon200702/fork_notepadqq_ubuntu2404.git
cd fork_notepadqq_ubuntu2404
````

If submodules were not fetched correctly:

```bash
git submodule update --init --recursive
```

### Ubuntu 24.04 build dependencies

Install the expected build dependencies:

```bash
sudo apt update
sudo apt install \
  build-essential \
  git \
  pkg-config \
  qtbase5-dev \
  qttools5-dev \
  qttools5-dev-tools \
  qtwebengine5-dev \
  libqt5websockets5-dev \
  libqt5svg5-dev \
  libuchardet-dev \
  qml-module-qtquick-controls \
  qml-module-qtquick-controls2 \
  qml-module-qtwebengine \
  qml-module-qtwebchannel \
  qml-module-qtquick-dialogs \
  qml-module-qt-labs-settings \
  qml-module-qt-labs-folderlistmodel
```

### Check Qt version

Before building, check the actual Qt version in your environment:

```bash
qmake -v
pkg-config --modversion Qt5Core
```

This fork targets Qt 5.15.x testing.

If your environment uses a different Qt version, please record it when reporting issues.

### Build

```bash
./configure --prefix /usr
make -j"$(nproc)"
```

### Run without installing

After building, prefer running from the build output first for testing.

Do not install system-wide until the build and runtime behavior are verified.

### Optional install

```bash
sudo make install
```

Use system-wide installation carefully. This fork is experimental.

---

## Distribution packages

The following commands install upstream or distribution-packaged Notepadqq versions.

They do **not** install this fork.

```bash
sudo apt install notepadqq
sudo snap install notepadqq
```

Use those only if you intentionally want the distribution/community package rather than this Ubuntu 24.04 compatibility fork.

---

## Smoke testing

Before using this fork for important files, run basic smoke tests.

Suggested test areas:

* Open file
* Edit file
* Save file
* Close and reopen
* UTF-8 Chinese text
* Emoji
* LF line endings
* CRLF line endings
* Tabs and spaces
* Trailing spaces
* NBSP and other invisible Unicode whitespace
* Search
* Replace
* Regex search and replace, if enabled
* Multi-tab switching
* Read-only file behavior
* External file modification detection
* Medium-size log files
* Long single-line files

A safe editor should not silently change file content, line endings, encoding, or invisible characters without user intent.

---

## Data-correctness checklist

When testing this fork, pay special attention to the following cases.

### Save and reopen

1. Open a UTF-8 file.
2. Edit a small line.
3. Save.
4. Close the file.
5. Reopen it.
6. Confirm the content is exactly what you expect.

### External modification

1. Open a file in Notepadqq.
2. Modify the same file externally from a terminal.
3. Return to Notepadqq.
4. Try to save.

Expected behavior:

* The editor should warn before overwriting external changes.

Risky behavior:

* The editor silently overwrites the external change.

### Read-only file

1. Mark a file as read-only.
2. Open it in Notepadqq.
3. Modify it.
4. Try to save.

Expected behavior:

* The editor clearly reports save failure.

Risky behavior:

* The UI behaves as if save succeeded even though the file was not written.

### Line endings

Test both LF and CRLF files.

Expected behavior:

* Line endings should not be changed silently.

### Unicode whitespace

Test files containing:

* Normal spaces
* Tabs
* Trailing spaces
* NBSP
* Zero-width spaces

Expected behavior:

* Content should not be normalized or converted silently.

---

## Known risk areas

The following areas need careful testing:

* Startup crash on newer OS / Qt versions
* QtWebEngine behavior
* Search and replace correctness
* Regex search and replace correctness
* Unicode whitespace preservation
* External file modification detection
* Read-only file save behavior
* Large file performance
* Session restore
* Clipboard behavior
* Wayland / X11 differences
* Packaging behavior

Please avoid relying on this fork for critical work until these areas are validated.

---

## Issue reporting

When reporting a bug, please include:

* OS version
* Desktop environment
* X11 or Wayland
* Qt version from `qmake -v`
* Qt version from `pkg-config --modversion Qt5Core`
* Compiler version
* Build command
* Whether submodules were initialized
* Steps to reproduce
* Expected behavior
* Actual behavior
* Example file if possible

For data-correctness issues, please also mention:

* File encoding
* Line ending format
* File size
* Whether the file is a symlink
* Whether the file is read-only
* Whether the file was modified externally
* Whether the issue happens after search/replace

---

## Contributing

Contributions are welcome, but this fork intentionally prioritizes conservative changes.

Please follow these principles:

1. Keep changes small and reviewable.
2. Preserve original license notices.
3. Do not remove attribution to the upstream project.
4. Do not rewrite large parts of the editor without discussion.
5. Do not change default shortcuts unless fixing a confirmed bug.
6. Do not remove features just to make the project compile.
7. Prefer compatibility fixes over redesigns.
8. Document behavior changes.
9. Include test steps when fixing runtime or data-correctness issues.
10. Treat AI-generated code as code that still requires human review.

Suggested commit style:

```text
docs: add Ubuntu 24.04 build notes
ci: add Ubuntu 24.04 Qt5 build workflow
build: fix Qt 5.15 include compatibility
runtime: fix startup crash on Qt 5.15
tests: add smoke test checklist
docs: document known Ubuntu 24.04 issues
```

---

## Security and data-loss reports

This fork is experimental.

If you find a vulnerability, crash, save failure, or data-loss issue, please open an issue with reproducible steps.

For data-loss reports, please provide a minimal example file whenever possible.

Important issue labels may include:

* `crash`
* `data-correctness`
* `save`
* `search-replace`
* `unicode`
* `ubuntu-24.04`
* `qt-5.15`

---

## Changelog

### Unreleased

Added:

* Ubuntu 24.04 compatibility focus
* Qt 5.15.x testing focus
* AI-assisted development notice
* Data-correctness checklist
* Smoke-test guidance

Changed:

* README now clearly marks this repository as an unofficial personal fork

Known issues:

* Runtime stability is still under testing
* Data-correctness tests are not complete
* This fork is not production-ready

---

## Upstream README note

Parts of the original Notepadqq README may still exist in this repository for historical and attribution purposes.

If any upstream installation instruction conflicts with this fork README, prefer the instructions in this fork README.

In particular:

* `apt install notepadqq` installs the distribution package, not this fork.
* `snap install notepadqq` installs the Snap package, not this fork.
* This fork currently expects source builds for testing.

---

## Acknowledgements

Thanks to the original Notepadqq authors and contributors for creating and maintaining the original project.

This fork exists because of their work.

```
```
