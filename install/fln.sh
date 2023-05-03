#!/usr/bin/bash

# TODO exa, exa-wrapper
# TODO libfuse on pacman

NVIM_DOWNLOAD_URL="https://github.com/neovim/neovim/releases/download/stable/nvim.appimage"
LF_DOWNLOAD_URL="https://github.com/gokcehan/lf/releases/download/r29/lf-linux-amd64.tar.gz"
PURE_REPO_URL="https://github.com/sindresorhus/pure.git"
ALACRITTY_THEMES_REPO_URL="https://github.com/alacritty/alacritty-theme"
NON_GUI_PROGRAMS=("zsh" "tmux" "vim" "curl" "libfuse2")

fln() {
  ln -f "${1}" "${2}"
}


install() {
  if ! command -v "${1}" &> /dev/null; then
    echo "Installing ${1}"...
    sudo apt-get install -y "${1}" > /dev/null
  fi 
}

install_libfuse() {
  if ! dpkg -s libfuse2 &> /dev/null; then
    sudo add-apt-repository -y universe &> /dev/null
    install apt libfuse2 
  fi
}

main() {
  if [[ ${1} == "apt" ]]; then
    echo "Adding repositories..."
    echo "Running 'apt update && apt upgrade'..."
    sudo apt-get update -y &> /dev/null && apt-get upgrade -y &> /dev/null
    for prog in "${NON_GUI_PROGRAMS[@]}"; do
       install "apt" "${prog}"
    done
  fi

  # nvim + configs for vim and vscodevim
  if ! command -v nvim &>/dev/null; then
    wget -O nvim ${NVIM_DOWNLOAD_URL}
    sudo mv nvim /usr/bin
    sudo chmod u+x /usr/bin/nvim
  fi

  mkdir -p ~/.vim
  mkdir -p ~/.config/nvim

  fln vim/vimrc ~/.vimrc
  fln vim/init.vim ~/.config/nvim
  fln vim/bindingrc ~/.vim
  fln vim/pluginrc ~/.vim
  fln vim/vscodevimrc ~/.vscodevimrc

  # lf
  if ! command -v lf &>/dev/null; then
    wget ${LF_DOWNLOAD_URL}
    sudo tar -xvzf lf*.tar.gz -C /usr/bin
    rm -f lf*.tar.gz
  fi
  mkdir -p ~/.config/lf
  fln lf/lfrc ~/.config/lf

  # alacritty
  if ! command -v alacritty &>/dev/null; then
    command -v cargo &>/dev/null || curl https://sh.rustup.rs -sSf | sh
    cargo install alacritty
  fi
  mkdir -p ~/.config/alacritty/themes
  git clone ${ALACRITTY_THEMES_REPO_URL} ~/.config/alacritty/themes 2>/dev/null
  fln alacritty/alacritty.yml ~/.config/alacritty

  # tmux
  fln tmux/tmux.conf ~/.tmux.conf

  # zsh
  fln zsh/zshrc ~/.zshrc
  mkdir -p ~/.config/zsh
  fln zsh/aliasrc ~/.config
  fln zsh/shortcutrc ~/.config
  git clone ${PURE_REPO_URL} ~/.config/zsh/pure 2>/dev/null
}

main "$@"
