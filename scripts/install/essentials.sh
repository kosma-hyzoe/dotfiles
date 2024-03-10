#!/usr/bin/bash
source $(dirname "$0")/header

[ -z "$ARCH" ] && ARCH="amd64"
[ -z "$DEFAULT_BIN_PATH" ] && DEFAULT_BIN_PATH="$HOME/.local/bin"

APT="zsh git curl wget vim htop xclip tmux openjdk-17-jdk python3 python3-pip"
PURE_REPO_URL="https://github.com/kosma-hyzoe/pure.git"
LF_DOWNLOAD_URL="https://github.com/gokcehan/lf/releases/download/r31/lf-linux-${ARCH}.tar.gz"

ill "$APT"


mkdir -p "$DEFAULT_BIN_PATH"

# lf
if ! command -v lf &>/dev/null; then
    wget "$LF_DOWNLOAD_URL" >/dev/null
    tar -xvzf lf*.tar.gz -C "$DEFAULT_BIN_PATH"
    rm -f lf*.tar.gz
fi

# zsh
mkdir -p "~/.config/zsh"
[ -d "~/.config/zsh/pure" ] || git clone ${PURE_REPO_URL} --depth=1 ~/.config/zsh/pure &>/dev/null

# gh
if ! command -v gh &>/dev/null && command -v apt &>/dev/null; then
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
        && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
        && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
        && sudo apt update
    ill gh
fi

# fzf
if ! command -v fzf &>/dev/null; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi
