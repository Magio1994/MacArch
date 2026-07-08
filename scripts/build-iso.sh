#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROFILE="$ROOT/archiso"
WORK="$PROFILE/work"
OUT="$PROFILE/out"

sudo rm -rf "$WORK"
mkdir -p "$OUT"

sudo mkarchiso -v -w "$WORK" -o "$OUT" "$PROFILE"

echo "ISO generated in:"
ls -lh "$OUT"/*.iso
