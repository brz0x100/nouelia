#!/usr/bin/env bash
set -euo pipefail

conf=/usr/lib/dracut/dracut.conf.d/99-nvidia.conf
if [ -f "$conf" ]; then
  sed -i 's@omit_drivers@force_drivers@g' "$conf"
  sed -i 's@ nvidia @ i915 amdgpu nvidia @g' "$conf"
else
  echo "warning: $conf not found; skipping early NVIDIA module loading" >&2
fi
