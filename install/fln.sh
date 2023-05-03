#!/usr/bin/bash

NVIM_DOWNLOAD_URL="https://github.com/neovim/neovim/releases/download/stable/nvim.appimage"
LF_DOWNLOAD_URL="https://github.com/gokcehan/lf/releases/download/r29/lf-linux-amd64.tar.gz"
PURE_REPO_URL="https://github.com/sindresorhus/pure.git"
ALACRITTY_THEMES_REPO_URL="https://github.com/alacritty/alacritty-theme"

main() {
  alias fln="ln -f --no-unlink"

  # nvim + configs for vim and vscodevim   
  if ! command -v nvim &> /dev/null; then
    wget -O nvim ${NVIM_DOWNLOAD_URL} 
    mv nvim /usr/bin
    chmod u+x /usr/bin/nvim
  fi

  mkdir -p ~/.vim
  mkdir -p ~/.config/nvim

  fln vim/vimrc ~/.vimrc
  fln vim/init.vim ~/.config/nvim
  fln vim/bindingrc ~/.vim
  fln vim/pluginrc ~/.vim
  fln vim/vscodevimrc ~/.vscodevimrc

  # lf
  if ! command -v lf &> /dev/null; then
    wget ${LF_DOWNLOAD_URL}
    tar -xvzf lf*.tar.gz
    rm -f lf*.tar.gz
    mv -f lf /usr/bin
  fi
  mkdir -p ~/.config/lf
  fln lf/lfrc ~/.config/lf

  # alacritty
  command -v cargo &> /dev/null || curl https://sh.rustup.rs -sSf | sh
  cargo install alacritty 
  mkdir -p ~/.config/alacritty/themes
  git clone ${ALACRITTY_THEMES_REPO_URL} ~/.config/alacritty/themes

  fln alacritty/alacritty.yml ~/.config/alacritty
  fln tmux/tmux.conf ~/.tmux.conf

  mkdir -p ~/.config/lf
  fln lf/lfrc ~/.config/lf

  fln zsh/zshrc ~/.zshrc
  mkdir -p ~/.config/zsh
  fln zsh/aliasrc ~/.config
  fln zsh/shortcutrc ~/.config
  git clone ${PURE_REPO_URL} ~/.config/zsh/pure 2> /dev/null

  unalias fln
}

main "$@"
