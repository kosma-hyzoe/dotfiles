#!/usr/bin/bash

# TODO exa, exa-wrapper, tmux

NVIM_DOWNLOAD_URL="https://github.com/neovim/neovim/releases/download/stable/nvim.appimage"
LF_DOWNLOAD_URL="https://github.com/gokcehan/lf/releases/download/r29/lf-linux-amd64.tar.gz"
PURE_REPO_URL="https://github.com/sindresorhus/pure.git"
ALACRITTY_THEMES_REPO_URL="https://github.com/alacritty/alacritty-theme"
NON_GUI_PROGRAMS="zsh tmux vim"

fln() {
  ln -f "${1}" "${2}"
}

main() {
  if [[ ${1} == "apt" ]]; then
    sudo apt update && apt upgrade
    sudo apt install -y "${NON_GUI_PROGRAMS}"
  elif [[ ${1} == "pacman" ]]; then
    pacman -Syu
    pacman -S --confirm "${NON_GUI_PROGRAMS}"
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
    tar -xvzf lf*.tar.gz
    rm -f lf*.tar.gz
    mv -f lf /usr/bin
  fi
  mkdir -p ~/.config/lf
  fln lf/lfrc ~/.config/lf

  # alacritty
  if ! command -v alacritty &>/dev/null; then
    command -v cargo &>/dev/null || curl https://sh.rustup.rs -sSf | sh
    cargo install alacritty
  fi
  mkdir -p ~/.config/alacritty/themes
  git clone ${ALACRITTY_THEMES_REPO_URL} ~/.config/alacritty/themes 2> /dev/null
  fln alacritty/alacritty.yml ~/.config/alacritty

  # tmux
  fln tmux/tmux.conf ~/.tmux.conf

  # zsh
  fln zsh/zshrc ~/.zshrc
  mkdir -p ~/.config/zsh
  fln zsh/aliasrc ~/.config
  fln zsh/shortcutrc ~/.config
  git clone ${PURE_REPO_URL} ~/.config/zsh/pure 2> /dev/null

}

main "$@"
