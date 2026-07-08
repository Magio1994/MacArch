#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

sudo pacman -Syu --needed - < "$ROOT/packages/repo-packages.txt"

echo "MacArch common repo packages installed."
echo "AUR packages are listed in packages/aur-packages.txt and will be handled separately."
