# 2023 Jakob Meng, <jakobmeng@web.de>
# vim:set fileformat=unix tabstop=8 shiftwidth=4 expandtab autoindent:
# kate: end-of-line unix; space-indent on; indent-width 4;

if command -v oc >/dev/null 2>&1; then
    source <(oc completion bash)
fi

update_oc() (
    set -euo pipefail
    mkdir -p ~/.local/bin
    cd ~/.local/bin
    oc_tar_url="https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz"
    oc_tar_sha256_url="https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/sha256sum.txt"
    oc_tar_base64=$(curl --silent --location "$oc_tar_url" | base64)
    oc_tar_sha256=$(echo "$oc_tar_base64" | base64 --decode | sha256sum | awk '{ print $1; }')
    oc_tar_sha256_ref=$(curl --silent --location "$oc_tar_sha256_url" \
                        | grep -e 'openshift-client-linux-[\.0-9]*\.tar\.gz$' \
                        | awk '{ print $1; }' )
    if [ "$oc_tar_sha256" != "$oc_tar_sha256_ref" ]; then
        echo "Checksum mismatch" >&2
        return 255
    fi

    if [ ! -e oc ]; then
        echo "$oc_tar_base64" | base64 --decode | tar --extract -z oc
        chmod a+x oc
        echo "Downloaded oc"
    else
        oc_sha256=$(echo "$oc_tar_base64" \
                    | base64 --decode | tar --extract -z oc --to-stdout | sha256sum | awk '{ print $1; }')
        oc_sha256_old=$(sha256sum oc | awk '{ print $1; }')
        if [ "$oc_sha256" != "$oc_sha256_old" ]; then
            echo "$oc_tar_base64" | base64 --decode | tar --extract -z oc
            chmod a+x oc
            echo "Updated to oc"
        else
            echo "Already updated to oc"
        fi
    fi
)
