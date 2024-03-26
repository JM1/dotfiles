# 2018 Jakob Meng, <jakobmeng@web.de>
#
# ~/.bash_profile is executed by bash for login shells.
# ~/.bash_profile is only executed by bash when started in interactive login mode,
#  which is typically only when you login at the console (Ctrl+Alt+F1..F6),
#  or connecting via ssh.
# ~/.bash_profile is not executed, if you log in graphically.
# ~/.bash_profile is not executed, if bash was started as an interactive non-login shell.
#
# References:
#  https://askubuntu.com/a/121075
#  man bash

if [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi

