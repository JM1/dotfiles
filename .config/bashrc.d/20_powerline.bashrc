# 2021-2023 Jakob Meng, <jakobmeng@web.de>
# vim:set fileformat=unix tabstop=8 shiftwidth=4 expandtab autoindent:
# kate: end-of-line unix; space-indent on; indent-width 4;

if command -v starship >/dev/null 2>&1; then
    : # starship has higher priority
else
    if [ "$TERM" != "linux" ] && [ "$TERM" != "xterm" ] && \
       [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
        # Ref.: https://powerline.readthedocs.io/en/latest/usage/shell-prompts.html
        powerline-daemon -q || true
        POWERLINE_BASH_CONTINUATION=1
        POWERLINE_BASH_SELECT=1
        . /usr/share/powerline/bindings/bash/powerline.sh
    fi
fi
