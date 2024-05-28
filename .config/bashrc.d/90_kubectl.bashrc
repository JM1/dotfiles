# 2023 Jakob Meng, <jakobmeng@web.de>
# vim:set fileformat=unix tabstop=8 shiftwidth=4 expandtab autoindent:
# kate: end-of-line unix; space-indent on; indent-width 4;

if command -v kubectl >/dev/null 2>&1; then
    source <(kubectl completion bash)
fi

update_kubectl() (
    set -euo pipefail
    mkdir -p ~/.local/bin
    cd ~/.local/bin
    k8s_release=$(curl --silent --location https://dl.k8s.io/release/stable.txt)
    kubectl_base64=$(curl --silent --location "https://dl.k8s.io/release/$k8s_release/bin/linux/amd64/kubectl" | base64)
    kubectl_sha256=$(echo "$kubectl_base64" | base64 --decode | sha256sum | awk '{ print $1; }')
    kubectl_sha256_ref=$(curl --silent --location "https://dl.k8s.io/$k8s_release/bin/linux/amd64/kubectl.sha256")
    if [ "$kubectl_sha256" != "$kubectl_sha256_ref" ]; then
        echo "Checksum mismatch" >&2
        return 255
    fi

    if [ ! -e kubectl ]; then
        echo "$kubectl_base64" | base64 --decode  > kubectl
        chmod a+x kubectl
        echo "Downloaded kubectl $k8s_release"
    else
        kubectl_sha256_old=$(sha256sum kubectl | awk '{ print $1; }')
        if [ "$kubectl_sha256" != "$kubectl_sha256_old" ]; then
            echo "$kubectl_base64" | base64 --decode  > kubectl
            chmod a+x kubectl
            echo "Updated to kubectl $k8s_release"
        else
            echo "Already updated to kubectl $k8s_release"
        fi
    fi
)
