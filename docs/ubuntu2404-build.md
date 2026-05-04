# Ubuntu 24.04 Build Baseline (Qt 5.15)

## Scope
This document records the **baseline** build expectations and observed environment status for this fork on Ubuntu 24.04.

## Expected apt packages
```bash
sudo apt update
sudo apt install -y \
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

## Repository structure check
Baseline check includes:
- `README.md`
- `configure`
- `notepadqq.pro`
- `src/`
- `build-tools/`
- `snap/`
- `.github/`

All above entries are present in this fork.

## Submodule status
Commands used:
```bash
git submodule status --recursive
git submodule sync --recursive
git submodule update --init --recursive
```

Observed status at baseline: no submodules were listed by `git submodule status --recursive`.

## Qt version check (required)
Commands:
```bash
qmake -v
pkg-config --modversion Qt5Core
```

Baseline observation in this environment:
- `qmake -v` failed with `qmake: command not found`
- `pkg-config --modversion Qt5Core` was not available because Qt dev tooling was not installed

> Important: this means the environment did **not** yet verify whether Qt is exactly `5.15.13`.
> On Ubuntu 24.04, you must record the **actual** detected version after installing dependencies.

## Baseline build attempt
Commands:
```bash
./configure --prefix /usr
make -j$(nproc)
```

Observed baseline result:
- `./configure` failed: `checking for QT5 qmake... not found!`
- `make` failed because no Makefile was generated.

## Known issues (baseline)
1. Missing Qt build tooling (`qmake`) blocks configuration.
2. Qt runtime/build version cannot be validated until dependencies are installed.
3. No build output is available yet, so runtime smoke tests are deferred.
