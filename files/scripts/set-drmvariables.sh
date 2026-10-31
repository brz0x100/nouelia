#!/usr/bin/env bash
set -euo pipefail

install -d /usr/lib/modprobe.d /etc/modprobe.d

cat > /usr/lib/modprobe.d/nvidia-modeset.conf <<'EOF'
# Nvidia modesetting support. Set to 0 or comment to disable kernel modesetting
# support. This must be disabled in case of SLI Mosaic.
options nvidia-drm modeset=1 fbdev=1
EOF

cp /usr/lib/modprobe.d/nvidia-modeset.conf /etc/modprobe.d/nvidia-modeset.conf
