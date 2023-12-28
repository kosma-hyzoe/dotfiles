#!/usr/bin/bash

source $(dirname "$0")/header
NVIM_DOWNLOAD_URL="https://github.com/neovim/neovim/releases/download/stable/nvim.appimage"

if ! dpkg -s libfuse2 &>/dev/null; then
    echo "Installing libfuse2..."
    sudo add-apt-repository -y universe &>/dev/null
    ill libfuse2 > /dev/null
fi

if ! command -v nvim &>/dev/null; then
    wget -O nvim ${NVIM_DOWNLOAD_URL}
    mkdir -p ~/.local/bin
    mv nvim ~/.local/bin
    chmod u+x ~/.local/nvim
fi
