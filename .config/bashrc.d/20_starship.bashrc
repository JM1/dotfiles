# 2023 Jakob Meng, <jakobmeng@web.de>
# vim:set fileformat=unix tabstop=8 shiftwidth=4 expandtab autoindent:
# kate: end-of-line unix; space-indent on; indent-width 4;

if [ "$TERM" != "linux" ] && [ "$TERM" != "xterm" ] && \
   command -v starship >/dev/null 2>&1; then
    # Ref.: https://starship.rs/guide/
    eval "$(starship init bash)"
fi
