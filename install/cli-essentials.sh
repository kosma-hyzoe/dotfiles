#!/usr/bin/bash

NVIM_DOWNLOAD_URL="https://github.com/neovim/neovim/releases/download/stable/nvim.appimage"
LF_DOWNLOAD_URL="https://github.com/gokcehan/lf/releases/download/r29/lf-linux-amd64.tar.gz"
PURE_REPO_URL="https://github.com/sindresorhus/pure.git"
APT_PROGRAMS=("zsh" "tmux" "vim.gtk3" "curl" "fuse" "gh" "htop")

install() {
  if ! command -v "${1}" &>/dev/null; then
    echo "Installing ${1}"...
    sudo apt-get install -y "${1}" >/dev/null
  fi
}

install_libfuse() {
  if ! dpkg -s libfuse2 &>/dev/null; then
    echo "Installing libfuse2..."
    sudo add-apt-repository -y universe &>/dev/null
    install libfuse2 > /dev/null
  fi
}

main() {
  echo "Running 'apt update && apt upgrade'..."
  sudo apt-get update -y &>/dev/null && apt-get upgrade -y &>/dev/null
  for prog in "${APT_PROGRAMS[@]}"; do
    install "${prog}"
  done
  install_libfuse

  # nvim
  if ! command -v nvim &>/dev/null; then
    wget -O nvim ${NVIM_DOWNLOAD_URL}
    sudo mv nvim /usr/bin
    sudo chmod u+x /usr/bin/nvim
  fi

  # lf
  if ! command -v lf &>/dev/null; then
    wget ${LF_DOWNLOAD_URL}
    sudo tar -xvzf lf*.tar.gz -C /usr/bin
    rm -f lf*.tar.gz
  fi

  # zsh
  mkdir -p ~/.config/zsh
  git clone ${PURE_REPO_URL} ~/.config/zsh/pure &>/dev/null
}
main "$@"
