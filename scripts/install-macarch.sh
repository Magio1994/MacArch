#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
USER_NAME="${SUDO_USER:-$USER}"
USER_HOME="$(getent passwd "$USER_NAME" | cut -d: -f6)"

echo "=== MacArch first install ==="
echo "Repo: $REPO_DIR"
echo "User: $USER_NAME"
echo "Home: $USER_HOME"

if [[ $EUID -ne 0 ]]; then
  echo "Errore: esegui con sudo:"
  echo "sudo ./scripts/install-macarch.sh"
  exit 1
fi

pacman -Syu --needed --noconfirm \
  plasma-meta \
  kde-applications-meta \
  sddm \
  networkmanager \
  git \
  curl \
  wget \
  unzip \
  rsync \
  firefox

systemctl enable NetworkManager
systemctl enable sddm

"$REPO_DIR/scripts/install-themes.sh"
"$REPO_DIR/scripts/apply-common.sh"

echo
echo "Installazione base MacArch completata."
echo "Prossimo passo: applicare temi e configurazioni."
