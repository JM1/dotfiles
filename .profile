# 2018-2021 Jakob Meng, <jakobmeng@web.de>
#
# ~/.profile is executed by the command interpreter for login shells.
# ~/.profile is executed by the script that launches your desktop environment, when you log in graphically.
# ~/.profile is not executed by bash, if ~/.bash_profile or ~/.bash_login exists.
# ~/.profile is not executed by bash, if bash was started as an interactive non-login shell.
#
# References:
#  https://askubuntu.com/a/121075
#  /etc/skel/.profile
#  man bash

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
         . "$HOME/.bashrc"
    fi
else
    # .bashrc will source .shrc otherwise
    if [ -f "${HOME}/.shrc" ]; then
        . "${HOME}/.shrc"
    fi
fi

