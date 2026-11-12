#!/usr/bin/env bash
set -euo pipefail

rm -f /etc/yum.repos.d/negativo17-fedora-nvidia.repo
rm -f /etc/yum.repos.d/negativo17-fedora-multimedia.repo
rm -f /etc/yum.repos.d/negativo17-fedora-nvidia-lts.repo
rm -f /etc/yum.repos.d/fedora-negativo17.repo
rm -f /etc/yum.repos.d/eyecantcu-supergfxctl.repo
rm -f /etc/yum.repos.d/_copr_ublue-os-akmods.repo
rm -f /etc/yum.repos.d/rpmfusion-nonfree-nvidia-driver.repo
rm -f /etc/yum.repos.d/rpmfusion-nonfree-nvidia-driver.repo.rpmsave
rm -f /etc/yum.repos.d/nvidia-container-toolkit.repo

# dnf5 vendor repos (Fedora 45+).
rm -f /usr/share/dnf5/repos.d/negativo17-fedora-nvidia.repo
rm -f /usr/share/dnf5/repos.d/negativo17-fedora-nvidia-lts.repo
rm -f /usr/share/dnf5/repos.d/nvidia-container-toolkit.repo
