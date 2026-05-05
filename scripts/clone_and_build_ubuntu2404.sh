#!/usr/bin/env bash
set -euo pipefail

REPO_URL="${REPO_URL:-https://github.com/moon200702/notepadqq_ubuntu2404.git}"
TARGET_DIR="${1:-notepadqq_ubuntu2404}"
PREFIX="${PREFIX:-/usr}"
JOBS="${JOBS:-$(nproc)}"

if [[ -e "$TARGET_DIR" ]]; then
  echo "[ERROR] target directory already exists: $TARGET_DIR" >&2
  exit 1
fi

echo "[1/7] Installing dependencies (Ubuntu 24.04)"
sudo apt-get update
sudo apt-get install -y \
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

echo "[2/7] Cloning repository"
git clone --recursive "$REPO_URL" "$TARGET_DIR"
cd "$TARGET_DIR"

echo "[3/7] Syncing submodules"
git submodule sync --recursive
git submodule update --init --recursive

echo "[4/7] Checking Qt version"
qmake -v
pkg-config --modversion Qt5Core

echo "[5/7] Running configure"
./configure --prefix "$PREFIX"

echo "[6/7] Building"
make -j"$JOBS"

echo "[7/7] Done"
echo "Build completed in: $(pwd)"
echo "Run from build output, or install with: sudo make install"
