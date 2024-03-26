# 2022 Jakob Meng, <jakobmeng@web.de>
# vim:set fileformat=unix tabstop=8 shiftwidth=4 expandtab autoindent:
# kate: end-of-line unix; space-indent on; indent-width 4;

# Enable Flatpak SDK extensions
# Ref.: https://github.com/flathub/com.visualstudio.code/blob/master/code.sh

if [ "$FLATPAK_ENABLE_SDK_EXT" = "*" ]; then
    SDK=()
    for d in /usr/lib/sdk/*; do
        SDK+=("${d##*/}")
    done
else
    IFS=',' read -ra SDK <<< "$FLATPAK_ENABLE_SDK_EXT"
fi

for i in "${SDK[@]}"; do
    if [[ -d /usr/lib/sdk/$i ]]; then
        if [[ -f /usr/lib/sdk/$i/enable.sh ]]; then
        . /usr/lib/sdk/$i/enable.sh
        else
            export PATH=$PATH:/usr/lib/sdk/$i/bin
        fi
    fi
done
