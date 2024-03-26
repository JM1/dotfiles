# 2021 Jakob Meng, <jakobmeng@web.de>
# vim:set fileformat=unix tabstop=8 shiftwidth=4 expandtab autoindent:
# kate: end-of-line unix; space-indent on; indent-width 4;

alias git_log_debian-changelog='git log --pretty="  * [%h] %s"'

git_pull_all() {
    find $* -maxdepth 3 -type d | while read dir; do
    (
        cd "$dir"
        if [ -d .git ]; then
            echo "cd $dir && git pull"
            git pull || true
        fi
    )
    done
}

git() {
    case $1 in
        "log")
            shift
            command git log --graph --decorate --all "$@"
            ;;
        "reflog")
            shift
            command git log --graph --reflog "$@"
            ;;
        *)
            command git "$@"
        ;;
    esac
}
