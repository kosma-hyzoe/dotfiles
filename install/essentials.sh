#!/usr/bin/bash

LF_DOWNLOAD_URL="https://github.com/gokcehan/lf/releases/download/r31/lf-linux-amd64.tar.gz"
PURE_REPO_URL="https://github.com/sindresorhus/pure.git"
APT_PROGRAMS=("vim-gtk3" "curl" "wget" "gh" "vim" "htop" "xclip")

source $(dirname "$0")/header

echo "Running 'apt update && apt upgrade'..."
sudo apt-get update -y &>/dev/null && apt-get upgrade -y &>/dev/null
ill $APT_PROGRAMS

# lf
if ! command -v lf &>/dev/null; then
wget ${LF_DOWNLOAD_URL}
sudo tar -xvzf lf*.tar.gz -C /usr/bin
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
