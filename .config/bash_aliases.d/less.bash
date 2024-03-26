# 2021 Jakob Meng, <jakobmeng@web.de>
# vim:set fileformat=unix tabstop=8 shiftwidth=4 expandtab autoindent:
# kate: end-of-line unix; space-indent on; indent-width 4;

# less with syntax highlighting
# Ref.: https://superuser.com/a/71593/629550

if [ -e /usr/share/source-highlight/src-hilite-lesspipe.sh ]; then
    # Debian
    export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
    export LESS=' -R '
elif [ -e /usr/bin/source-highlight/src-hilite-lesspipe.sh ]; then
    # Fedora
    export LESSOPEN="| /usr/bin/source-highlight/src-hilite-lesspipe.sh %s"
    export LESS=' -R '
fi
