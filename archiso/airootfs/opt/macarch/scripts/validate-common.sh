#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "Checking shell scripts..."
for script in "$ROOT"/scripts/*.sh; do
    bash -n "$script"
done

echo "Checking required files..."
required=(
    "packages/common-packages.txt"
    "scripts/install-common-packages.sh"
    "scripts/install-themes.sh"
    "scripts/apply-common.sh"
    "scripts/install-macarch-common.sh"
    "overlays/common/etc/systemd/zram-generator.conf"
    "overlays/common/etc/sddm.conf.d/theme.conf"
)

for file in "${required[@]}"; do
    if [[ ! -e "$ROOT/$file" ]]; then
        echo "ERROR: missing $file"
        exit 1
    fi
done

echo "Checking non-portable references..."
if grep -RInE '(/home/ale|/run/media/ale|macharch-z50|3818546118542064)' \
    "$ROOT/overlays" "$ROOT/scripts" 2>/dev/null | grep -v 'scripts/validate-common.sh'; then
    echo "ERROR: non-portable references found"
    exit 1
fi

echo "MacArch common validation passed."
