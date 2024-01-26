#!/usr/bin/bash

source $(dirname "$0")/header

APT_PKGS="git curl wget gh vim htop xclip tmux"
DEFAULT_BIN_PATH="$HOME/.local/bin"
PURE_REPO_URL="https://github.com/sindresorhus/pure.git"
if [[ $(uname -m) == "x86_64" ]]; then
    ARCH="amd64"
elif [[ $(uname -m) == "aarch64" ]]; then
    ARCH="arm64"
else
    ARCH="arm"
fi
LF_DOWNLOAD_URL="https://github.com/gokcehan/lf/releases/download/r31/lf-linux-${ARCH}.tar.gz"


echo "Running 'apt update && apt upgrade'..."
sudo apt-get update -y &>/dev/null && apt-get upgrade -y &>/dev/null
ill APT_PKGS


mkdir -p $DEFAULT_BIN_PATH

# lf
if ! command -v lf &>/dev/null; then
    wget ${LF_DOWNLOAD_URL}
    tar -xvzf lf*.tar.gz -C $DEFAULT_BIN_PATH
    rm -f lf*.tar.gz
fi

# zsh
ill zsh
mkdir -p ~/.config/zsh
git clone ${PURE_REPO_URL} ~/.config/zsh/pure &>/dev/null

# gh
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update
ill gh


# fzf
if ! command -v fzf &>/dev/null; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi
