# 2021 Jakob Meng, <jakobmeng@web.de>
# vim:set fileformat=unix tabstop=8 shiftwidth=4 expandtab autoindent:
# kate: end-of-line unix; space-indent on; indent-width 4;

# Ref.: http://www.robmeerman.co.uk/unix/256colours
if [ ! -z "$TERMCAP" ] && [ "$TERM" == "screen" ]; then
    export TERMCAP=$(echo $TERMCAP | sed -e 's/Co#8/Co#256/g')
fi
