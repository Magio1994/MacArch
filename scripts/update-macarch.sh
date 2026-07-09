#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "=== MacArch update ==="
echo "Repo: $REPO_DIR"

cd "$REPO_DIR"
git pull --ff-only

echo
echo "Repository aggiornato."
echo "Prossimo passo: riapplicare configurazioni e temi quando saranno collegati a questo script."
