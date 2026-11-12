#!/usr/bin/env bash
set -euo pipefail

dnf5 -y install /tmp/rpms/ublue-os/ublue-os-nvidia*.rpm

# Fedora 45 ships the ublue addons' repo files as dnf5 vendor repos under
# /usr/share/dnf5/repos.d instead of /etc/yum.repos.d.
repo_file=/usr/share/dnf5/repos.d/negativo17-fedora-nvidia.repo
sed -i '0,/enabled=0/{s/enabled=0/enabled=1\npriority=90/}' "$repo_file"
dnf5 -y install \
  /tmp/rpms/kmods/kmod-nvidia*.rpm \
  libnvidia-fbc \
  libva-nvidia-driver \
  nvidia-driver \
  nvidia-driver-cuda \
  nvidia-modprobe \
  nvidia-persistenced \
  nvidia-settings
