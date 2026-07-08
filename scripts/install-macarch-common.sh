#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

"$ROOT/scripts/install-common-packages.sh"
"$ROOT/scripts/install-themes.sh"
"$ROOT/scripts/apply-common.sh"

sudo systemctl enable NetworkManager
sudo systemctl enable sddm
sudo systemctl enable bluetooth || true

echo "MacArch common installation complete."
echo "Reboot or log out/in to apply everything."
