# 2021-2023 Jakob Meng, <jakobmeng@web.de>
# vim:set fileformat=unix tabstop=8 shiftwidth=4 expandtab autoindent:
# kate: end-of-line unix; space-indent on; indent-width 4;

# Debian has /usr/share/doc/fzf/examples/key-bindings.bash
# Fedora has /usr/share/fzf/shell/key-bindings.bash
# Flatpak has /usr/lib/sdk/fzf/share/shell/key-bindings.bash

for path in \
    /usr/share/doc/fzf/examples/key-bindings.bash \
    /usr/share/fzf/shell/key-bindings.bash \
    /usr/lib/sdk/fzf/share/shell/key-bindings.bash; do
    if [[ -f "$path" ]]; then
        . "$path"
        break
    fi
done
