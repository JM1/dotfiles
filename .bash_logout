# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console clear the screen to increase privacy
if [[ "$SHLVL" = 1 ]] && command -v clear_console >/dev/null; then
    clear_console -q
fi
