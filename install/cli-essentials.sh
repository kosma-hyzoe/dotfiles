#!/usr/bin/bash

# TODO if update, if apt
# TODO zsh autocomplete

NVIM_DOWNLOAD_URL="https://github.com/neovim/neovim/releases/download/stable/nvim.appimage"
LF_DOWNLOAD_URL="https://github.com/gokcehan/lf/releases/download/r29/lf-linux-amd64.tar.gz"
PURE_REPO_URL="https://github.com/sindresorhus/pure.git"
NON_GUI_PROGRAMS=("zsh" "tmux" "vim.gtk3" "curl" "git")
EXA_WRAPPER_URL="https://gist.githubusercontent.com/tachoknight/b57da58a3ddb4f3f52f8480a90757a9f/raw/45146476aa8adbcc128c5145fc15247882d7a742/exa-wrapper.sh"

install() {
  if ! command -v "${1}" &>/dev/null; then
    echo "Installing ${1}"...
    sudo apt-get install -y "${2}" >/dev/null
  fi
}

install_libfuse() {
  if ! dpkg -s libfuse2 &>/dev/null; then
    echo "Installing libfuse2..."
    sudo add-apt-repository -y universe &>/dev/null
    install libfuse2
  fi
}

main() {
  echo "Running 'apt update && apt upgrade'..."
  sudo apt-get update -y &>/dev/null && apt-get upgrade -y &>/dev/null
  for prog in "${NON_GUI_PROGRAMS[@]}"; do
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


  # exa
  curl ${EXA_WRAPPER_URL} > /tmp/exa-wrapper.sh
  sudo chown "$(whoami)" /tmp/exa-wrapper.sh
  sudo chmod u+x /tmp/exa-wrapper.sh
  sudo mv /tmp/exa-wrapper.sh /usr/bin

 if ! command -v exa &>/dev/null; then
    # install cargo if needed
    if ! command -v cargo &>/dev/null; then
      curl https://sh.rustup.rs -sSf | sh
      # shellcheck source=/dev/null
      source "$HOME/.cargo/env"
    fi
    echo "Installing exa..."
    cargo install exa >/dev/null
  fi
} 
main "$@"
