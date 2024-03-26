# 2021-2022 Jakob Meng, <jakobmeng@web.de>
# vim:set fileformat=unix tabstop=8 shiftwidth=4 expandtab autoindent:
# kate: end-of-line unix; space-indent on; indent-width 4;

if command -v exa >/dev/null 2>&1; then
    function ll() {
        exa --all --long --group --classify --extended --group-directories-first --color=always "$@" | less -R --no-init --quit-if-one-screen
    }
    alias l="ll --all"
else
    function ll() {
        ls -l --human-readable --classify --group-directories-first --color=always "$@" | less -R --no-init --quit-if-one-screen
    }
    alias l="ll --almost-all"
fi
