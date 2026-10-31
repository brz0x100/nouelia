#!/usr/bin/env bash
set -euo pipefail

dnf5 -y install --nogpgcheck \
  --repofrompath "terra,https://repos.fyralabs.com/terra$(rpm -E %fedora)" \
  terra-release
