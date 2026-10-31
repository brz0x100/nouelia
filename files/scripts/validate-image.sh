#!/usr/bin/env bash
set -euo pipefail

chmod 755 /usr/libexec/niri-greeter-setup

# niri 26.04 still uses a blanket systemctl import-environment, which is
# deprecated in systemd 259. Use the upstream dbus/systemd import path.
if grep -q '^    systemctl --user import-environment$' /usr/bin/niri-session; then
  sed -i 's|^    systemctl --user import-environment$|    if hash dbus-update-activation-environment 2>/dev/null; then dbus-update-activation-environment --systemd --all; else systemctl --user import-environment XDG_CURRENT_DESKTOP XDG_SESSION_TYPE XDG_SESSION_DESKTOP XDG_SESSION_ID XDG_RUNTIME_DIR; fi|' /usr/bin/niri-session
fi

! grep -q '^    systemctl --user import-environment$' /usr/bin/niri-session
command -v dbus-update-activation-environment
command -v dbus-run-session
niri validate --config /etc/niri/config.kdl
noctalia --version
test -x /usr/bin/noctalia-greeter-session
