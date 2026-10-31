#!/usr/bin/env bash
set -euo pipefail

dnf5 -y install /tmp/rpms/ublue-os/ublue-os-nvidia*.rpm
sed -i '0,/enabled=0/{s/enabled=0/enabled=1\npriority=90/}' /etc/yum.repos.d/negativo17-fedora-nvidia.repo
dnf5 -y install \
  /tmp/rpms/kmods/kmod-nvidia*.rpm \
  libnvidia-fbc \
  libva-nvidia-driver \
  nvidia-driver \
  nvidia-driver-cuda \
  nvidia-modprobe \
  nvidia-persistenced \
  nvidia-settings
