# 2024 Jakob Meng, <jakobmeng@web.de>
# vim:set fileformat=unix tabstop=8 shiftwidth=4 expandtab autoindent:
# kate: end-of-line unix; space-indent on; indent-width 4;
#
# Dotfiles Management
# Ref.: https://mitxela.com/projects/dotfiles_management

# How to set up
# -------------
#
# $> git clone --bare https://github.com/JM1/dotfiles.git ~/.config/dotfiles
# $> alias dotfiles='git "--git-dir=$HOME/.config/dotfiles" "--work-tree=$HOME"'
# $> dotfiles config --local status.showUntrackedFiles no
#
# Unstage changes
# $> dotfiles restore --staged $HOME
#
# List changed files
# $> dotfiles status
#
# Restore deleted files
# $> dotfiles restore $(dotfiles ls-files -d)
#
# List changes for remaining files
# $> dotfiles diff
#
# Overwrite changes to modified files
# $> dotfiles restore $HOME

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
