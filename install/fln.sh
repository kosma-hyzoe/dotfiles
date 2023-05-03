#!/usr/bin/bash

alias link="link --no-unlink"
NVIM_DOWNLOAD_URL="https://github.com/neovim/neovim/releases/download/stable/nvim.appimage"
LF_DOWNLOAD_URL="https://github.com/gokcehan/lf/releases/download/r29/lf-linux-amd64.tar.gz"
PURE_REPO_URL="https://github.com/sindresorhus/pure.git"
ALACRITTY_THEMES_REPO_URL="https://github.com/alacritty/alacritty-theme"


  # nvim + configs for vim and vscodevim   
if ! command -v nvim &> /dev/null; then
  wget -O nvim ${NVIM_DOWNLOAD_URL} 
  mv nvim /usr/bin
  chmod u+x /usr/bin/nvim
fi

mkdir -p ~/.vim
mkdir -p ~/.config/nvim

link vim/vimrc ~/.vimrc
link vim/init.vim ~/.config/nvim
link vim/bindingrc ~/.vim
link vim/pluginrc ~/.vim
link vim/vscodevimrc ~/.vscodevimrc

# lf
if ! command -v lf &> /dev/null; then
  wget &{LF_DOWNLOAD_URL}
  tar -xvzf lf*.tar.gz
  rm -f lf*.tar.gz
  mv -f lf /usr/bin
fi
mkdir -p ~/.config/lf
link lf/lfrc ~/.config/lf

# alacritty
command -v cargo &> /dev/null || curl https://sh.rustup.rs -sSf | sh
cargo install alacritty 
mkdir -p ~/.config/alacritty/themes
git clone ${ALACRITTY_THEMES_REPO_URL} ~/.config/alacritty/themes

link alacritty/alacritty.yml ~/.config/alacritty
link tmux/tmux.conf ~/.tmux.conf

mkdir -p ~/.config/lf
link lf/lfrc ~/.config/lf

link zsh/zshrc ~/.zshrc
mkdir -p ~/.config/zsh
link zsh/aliasrc ~/.config
link zsh/shortcutrc ~/.config
git clone ${PURE_REPO_URL} ~/.config/zsh/pure 2>/dev/null

unalias link