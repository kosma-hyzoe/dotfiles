!#/usr/bin/bash

if [[ $(uname -m) == "x86_64" ]]; then
    ARCH="amd64"
elif [[ $(uname -m) == "aarch64" ]]; then
    ARCH="arm64"
else
    ARCH="arm"
fi
LF_DOWNLOAD_URL="https://github.com/gokcehan/lf/releases/download/r31/lf-linux-${ARCH}.tar.gz"

if ! command -v lf &>/dev/null; then
    wget ${LF_DOWNLOAD_URL}
    tar -xvzf lf*.tar.gz -C $DEFAULT_BIN_PATH
    rm -f lf*.tar.gz
fi
