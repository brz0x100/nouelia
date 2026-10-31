#!/usr/bin/env bash
set -euo pipefail

command -v nvidia-smi
rpm -q nvidia-driver
test -f /usr/lib/modprobe.d/nvidia-modeset.conf
test -f /etc/modprobe.d/nvidia-modeset.conf
grep -q 'force_drivers' /usr/lib/dracut/dracut.conf.d/99-nvidia.conf
test -d "/usr/lib/modules/$(rpm -q --qf '%{VERSION}-%{RELEASE}.%{ARCH}' kernel-core)/extra/nvidia"
