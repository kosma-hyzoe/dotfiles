#!/usr/bin/bash

alias link="link --no-unlink"
NVIM_DOWNLOAD_URL="https://github.com/neovim/neovim/releases/download/stable/nvim.appimage"

# TODO do i need to rename nvim.image
# TODO cargo install skip fetch?
fln() {
  # vim config + nvim installation
  command -v nvim &> /dev/null && wget -P /usr/bin -O nvim ${NVIM_DOWNLOAD_URL} 
  chmod u+x /usr/bin/nvim
  mkdir -p ~/.vim

  link vim/vimrc ~/.vimrc
  link vim/init.vim ~/.config/nvim
  link vim/bindingrc ~/.vim
  link vim/pluginrc ~/.vim
  link vim/vscodevimrc ~/.vscodevimrc


  command -v cargo &> curl https://sh.rustup.rs -sSf | sh
  cargo install alacritty 
  mkdir -p ~/.config/alacritty/themes
  git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

  link alacritty/alacritty.yml ~/.config/alacritty
  link tmux/tmux.conf ~/.tmux.conf

  mkdir -p ~/.config/lf
  link lf/lfrc ~/.config/lf

  link zsh/zshrc ~/.zshrc
  mkdir -p ~/.config/zsh
  link zsh/aliasrc ~/.config
  link zsh/shortcutrc ~/.config
  git clone https://github.com/sindresorhus/pure.git ~/.config/zsh/pure 2>/dev/null
}
