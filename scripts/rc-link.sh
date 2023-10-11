#!/bin/bash

main() {
  cd $(dirname "$0")/..

  # vim
  mkdir  ~/.vim
  ln -sf vim/vimrc ~/.vim
  ln -sf vim/colorscheme.vim ~/.vim
  ln -sf vim/remaps.vim ~/.vim
  ln -sf vim/plugins.vim ~/.vim

  # lf
  mkdir -p ~/.config/lf
  ln -sf lf/lfrc ~/.config/lf

  # tmux
  [[ $(uname -v) == "*Ubuntu*" ]] &>/dev/null && \
      ln -sf tmux/corp-tmux.conf ~/.tmux.conf || \
      ln -sf tmux/tmux.conf ~/.tmux.conf

  # shell
  ln -sf shell/zshrc ~/.zshrc
  ln -sf shell/bashrc ~/.bashrc
  ln -sf shell/aliasrc ~/.config

  # ipython
  mkdir -p ~/.ipython/profile_default
  ln -sf misc/ipython_config.py ~/.ipython/profile_default
  
  # alacritty
  mkdir -p ~/.config/alacritty
  ln -sf alacritty/alacritty.yml ~/.config/alacritty

  cd -
}

main "$@"
