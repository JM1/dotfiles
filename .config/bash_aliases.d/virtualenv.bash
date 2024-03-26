# 2021 Jakob Meng, <jakobmeng@web.de>
# vim:set fileformat=unix tabstop=8 shiftwidth=4 expandtab autoindent:
# kate: end-of-line unix; space-indent on; indent-width 4;

mkvenv() (
    local env=""
    local py=""

    help() {
        cat << ________EOF
Usage:  mkvenv [OPTIONS] ENV [VIRTUALENV_OPTIONS]

Create virtual Python instance ENV in \$WORKON_HOME with virtualenv

Options:
      -h, --help    Print usage
      -2            Use Python 2 interpreter
      -3            Use Python 3 interpreter
________EOF
    }

    if [ $# -eq 0 ]; then
        help
        exit
    fi

    while [ -n "$1" ]; do
        case "$1" in
            "-h"|"--help"|"")
                help
                exit
                ;;
            "-2")
                py="2"
                ;;
            "-3")
                py="3"
                ;;
            *)
                env="$1"
                shift
                break
                ;;
        esac
        shift
    done

    if [ -z "$env" ]; then
        help
        exit
    fi

    if [ -z "$WORKON_HOME" ]; then
        echo "WORKON_HOME not set" >&2
        exit 255
    fi

    if command -v virtualenv >/dev/null 2>&1; then
        virtualenv $([ -n "$py" ] && echo "-p python$py") "$@" "$WORKON_HOME/$env"
    else
        if [ -n "$py" ]; then
            "python$py" -m venv "$@" "$WORKON_HOME/$env"
        else
            python -m venv "$@" "$WORKON_HOME/$env"
        fi
    fi
)

workon() (
    # bash completions provided by file
    # ~/.local/share/bash-completion/completions/workon

    local env=""

    help() {
        cat << ________EOF
Usage:  workon [OPTIONS] ENV

Activate virtual Python instance ENV in \$WORKON_HOME

Options:
      -h, --help    Print usage
________EOF
    }

    if [ $# -eq 0 ]; then
        help
        exit
    fi

    while [ -n "$1" ]; do
        case "$1" in
            "-h"|"--help")
                help
                exit
                ;;
            ".")
                (. .venv/bin/activate && exec bash)
                exit
                ;;
            *"/"*)
                (. "$env/.venv/bin/activate" && exec bash)
                exit
                ;;
            *)
                env="$1"
                shift
                if [ -n "$1" ]; then
                    echo "Ignoring superfluous paramters: $*" >&2
                fi
                break
                ;;
        esac
        shift
    done

    if [ -z "$env" ]; then
        help
        exit
    fi

    if [ -z "$WORKON_HOME" ]; then
        echo "WORKON_HOME not set" >&2
        return 255
    fi

    (. "$WORKON_HOME/$env/bin/activate" && exec bash)
)
