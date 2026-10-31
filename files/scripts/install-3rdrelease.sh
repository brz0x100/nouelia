#!/usr/bin/env bash
set -euo pipefail

dnf5 -y install --nogpgcheck \
  --repofrompath "terra,https://repos.fyralabs.com/terra$(rpm -E %fedora)" \
  terra-release

# Drop metadata cached from a transient Terra mirror failure before the
# package transaction runs.
dnf5 makecache --enablerepo=terra