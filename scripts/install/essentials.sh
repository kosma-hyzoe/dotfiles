#!/bin/bash

source "$(dirname "$0")/header"

[ -z "$ARCH" ] && ARCH="amd64"

CAN_SUDO=1

APT="zsh git curl wget vim htop xclip tmux python3 python3-pip exfatprogs"
PURE_REPO_URL="https://github.com/kosma-hyzoe/pure.git"
LF_DOWNLOAD_URL="https://github.com/gokcehan/lf/releases/download/r32/lf-linux-${ARCH}.tar.gz"



mkdir -p ~/.local/bin

# lf
if ! command -v lf &>/dev/null; then
    wget "$LF_DOWNLOAD_URL" >/dev/null
    tar -xvzf lf*.tar.gz -C "$DEFAULT_BIN_PATH"
    rm -f lf*.tar.gz
fi

# zsh
mkdir -p ~/.config/zsh
[ -d ~/.config/zsh/pure ] || git clone ${PURE_REPO_URL} --depth=1 ~/.config/zsh/pure &>/dev/null

if [[ $CAN_SUDO -eq 1 ]]; then
    ill "$APT"
fi

# fzf
if ! command -v fzf &>/dev/null; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi
