#!/usr/bin/env bash
set -euo pipefail

# os-release VERSION looks like "45.20261112.0 (Forty Five)".
# Keep Fedora's <version>.<date>.<build> part and drop the codename.
os_release=/usr/lib/os-release
version="$(. "$os_release"; printf '%s' "${VERSION%% (*}")"

if [ -z "$version" ]; then
  echo "error: VERSION is empty in $os_release" >&2
  exit 1
fi

pretty_name="Fedora Linux ${version} (Nouelia)"
sed -i "s|^PRETTY_NAME=.*|PRETTY_NAME=\"${pretty_name}\"|" "$os_release"

# /etc/os-release is a symlink to /usr/lib/os-release on Fedora, so both
# paths now report the new name.
grep -qx "PRETTY_NAME=\"${pretty_name}\"" "$os_release"
