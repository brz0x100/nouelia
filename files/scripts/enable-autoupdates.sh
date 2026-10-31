#!/usr/bin/env bash

set -euo pipefail

systemctl unmask rpm-ostreed-automatic.timer
systemctl enable rpm-ostreed-automatic.timer
systemctl enable podman-auto-update.timer
systemctl --global enable podman-auto-update.timer
