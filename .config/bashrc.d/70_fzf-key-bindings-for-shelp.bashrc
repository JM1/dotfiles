# 2021 Jakob Meng, <jakobmeng@web.de>
# vim:set tabstop=8 shiftwidth=4 expandtab:
# kate: space-indent on; indent-width 4;

# Enable shelp key binding (Ctrl+H)
if command -v fzf >/dev/null && [ -d "$HOME/.local/share/shelp/" ]; then
    if command -v tre-agrep >/dev/null; then
        _shelp_fzf() {
            FZF_DEFAULT_COMMAND="grep -l '*' *" fzf \
                --bind "change:reload:tre-agrep -1 -i -l {q} * || true" \
                --bind "pgup:preview-page-up,pgdn:preview-page-down" \
                --ansi --layout=reverse-list --border --height 100% --phony --query '' \
                --preview '[ -n {} ] && less {} '
        }
    else
        _shelp_fzf() {
            FZF_DEFAULT_COMMAND="grep -l '*' *" fzf \
                --bind "change:reload:grep -l {q} * || true" \
                --bind "pgup:preview-page-up,pgdn:preview-page-down" \
                --ansi --layout=reverse-list --border --height 100% --phony --query '' \
                --preview '[ -n {} ] && less {} '
        }
    fi

# TODO: Trim output to preview window size?
# --preview '[ -n {} ] && less {} | tail -n +"$(grep --line-number {q} {} | cut -f1 -d: | head -n 1)" | head -'$LINES

    _shelp() (
        cd "$HOME/.local/share/shelp/"
        FILE="$(_shelp_fzf)"
        if [ -n "$FILE" ]; then
            if [ -n "$DISPLAY" ]; then
                kate "$FILE"
            else
                view "$FILE"
            fi
        fi
    )

    bind -x '"\C-h": "_shelp"'
fi
