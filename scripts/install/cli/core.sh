#!/bin/bash

source "$(dirname "$0")/../header"

[ -z "$ARCH" ] && ARCH="amd64"
[ -z "$DEFAULT_BIN_PATH" ] && DEFAULT_BIN_PATH="$HOME/.local/bin"

CAN_SUDO=1

APT="zsh git curl wget vim xclip tmux htop shellcheck python3 progress trash-cli speedtest-cli smartmontools exfatprogs "
PURE_REPO_URL="https://github.com/kosma-hyzoe/pure.git"
LF_DOWNLOAD_URL="https://github.com/gokcehan/lf/releases/download/r34/lf-linux-${ARCH}.tar.gz"

if [[ $CAN_SUDO -eq 1 ]]; then
    ill "$APT"
fi

mkdir -p "$DEFAULT_BIN_PATH"

# lf
if ! command -v lfffa &>/dev/null; then
    wget "$LF_DOWNLOAD_URL" >/dev/null
    tar -xvzf lf*.tar.gz -C "$DEFAULT_BIN_PATH"
    rm -f lf*.tar.gz
fi

# zsh
mkdir -p ~/.config/zsh
[ -d ~/.config/zsh/pure ] || git clone ${PURE_REPO_URL} --depth=1 ~/.config/zsh/pure &>/dev/null

# fzf
if ! command -v fzf &>/dev/null; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi

# npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
nvm install --lts

sudo rm -rf /usr/lib/python3.*/EXTERNALLY-MANAGED
