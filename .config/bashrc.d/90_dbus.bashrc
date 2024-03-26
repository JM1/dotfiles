# 2023 Jakob Meng, <jakobmeng@web.de>
# vim:set fileformat=unix tabstop=8 shiftwidth=4 expandtab autoindent:
# kate: end-of-line unix; space-indent on; indent-width 4;

# start message bus in a container if it has a display server running
if [ -n "$DISPLAY" ] && [ -z "$DBUS_SESSION_BUS_ADDRESS" ] && command -v dbus-launch >/dev/null 2>&1; then
    eval $(dbus-launch)
fi
