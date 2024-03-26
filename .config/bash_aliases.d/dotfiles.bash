# 2024 Jakob Meng, <jakobmeng@web.de>
# vim:set fileformat=unix tabstop=8 shiftwidth=4 expandtab autoindent:
# kate: end-of-line unix; space-indent on; indent-width 4;

# Dotfiles Management
#
# Ref.:
# [0] https://mitxela.com/projects/dotfiles_management

alias dotfiles='git "--git-dir=$HOME/.config/dotfiles" "--work-tree=$HOME"'

dot() {
    if [[ "$#" -eq 0 ]]; then
        (
            cd /
            for i in $(dotfiles ls-files); do
                echo -n "$(dotfiles -c color.status=always status "$i" -s | sed "s#$i##")"
                echo -e "¬/$i¬\e[0;33m$(dotfiles -c color.ui=always log -1 --format="%s" -- "$i")\e[0m"
            done
        ) | column -t --separator=¬ -T2
    else
        dotfiles "$@"
    fi
}
