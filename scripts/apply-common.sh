#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OVERLAY="$ROOT/overlays/common"

echo "Installing MacArch common system configuration..."
sudo cp -a "$OVERLAY/etc/." /etc/

echo "Installing MacArch common user configuration..."
mkdir -p "$HOME/.config" "$HOME/.local/share"
cp -a "$OVERLAY/home/." "$HOME/"

echo "MacArch common configuration applied."
echo "Log out and log back in to load the Plasma configuration."
