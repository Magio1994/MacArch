#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

pacman -Qqen > "$ROOT/packages/repo-packages.txt"
pacman -Qqem > "$ROOT/packages/aur-packages.txt"

echo "MacArch common synced."
