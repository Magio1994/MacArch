#!/usr/bin/env bash
set -euo pipefail

WORKDIR="${WORKDIR:-$HOME/.cache/macarch-sources}"
mkdir -p "$WORKDIR"
cd "$WORKDIR"

clone_checkout() {
  local url="$1"
  local dir="$2"
  local commit_file="$3"

  if [ ! -d "$dir/.git" ]; then
    git clone "$url" "$dir"
  fi

  cd "$dir"
  git fetch --all --tags
  git checkout "$(cat "$commit_file")"
  cd "$WORKDIR"
}

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

clone_checkout https://github.com/vinceliuice/WhiteSur-kde.git WhiteSur-kde "$ROOT/sources/whitesur-kde.commit"
clone_checkout https://github.com/vinceliuice/WhiteSur-icon-theme.git WhiteSur-icon-theme "$ROOT/sources/whitesur-icons.commit"
clone_checkout https://github.com/vinceliuice/WhiteSur-cursors.git WhiteSur-cursors "$ROOT/sources/whitesur-cursors.commit"
clone_checkout https://github.com/vinceliuice/WhiteSur-firefox-theme.git WhiteSur-firefox-theme "$ROOT/sources/whitesur-firefox.commit"

cd "$WORKDIR/WhiteSur-kde"
./install.sh -c light -w default

cd "$WORKDIR/WhiteSur-icon-theme"
./install.sh

cd "$WORKDIR/WhiteSur-cursors"
./install.sh

cd "$WORKDIR/WhiteSur-firefox-theme"
./install.sh

cd "$WORKDIR/WhiteSur-kde/sddm"
sudo ./install.sh

echo "MacArch themes installed."
