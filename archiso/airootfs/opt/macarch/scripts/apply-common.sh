#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OVERLAY="$ROOT/overlays/common"

echo "Installing MacArch common system configuration..."

if [ -d "$OVERLAY/etc" ]; then
    sudo cp -a "$OVERLAY/etc/." /etc/
fi

if [ -d "$OVERLAY/usr" ]; then
    sudo cp -a "$OVERLAY/usr/." /usr/
fi

echo "Installing MacArch common user configuration..."

if [ -d "$OVERLAY/home" ]; then
    cp -a "$OVERLAY/home/." "$HOME/"
fi

echo "MacArch common configuration applied."
echo "Log out and log back in to load the Plasma configuration."
