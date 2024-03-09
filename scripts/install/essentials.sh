#!/usr/bin/bash
source $(dirname "$0")/header

APT="zsh git curl wget vim htop xclip tmux openjdk-17-jdk python3"
PURE_REPO_URL="https://github.com/sindresorhus/pure.git"


ill $APT

mkdir -p "$HOME/.local/bin"

# lf
./lf.sh

# zsh
mkdir -p ~/.config/zsh
git clone ${PURE_REPO_URL} ~/.config/zsh/pure &>/dev/null

# gh
if ! command -v gh &>/dev/null && command -v apt &>/dev/null; then
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
        && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
        && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
        && sudo apt update
fi
ill gh


# fzf
if ! command -v fzf &>/dev/null; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi
