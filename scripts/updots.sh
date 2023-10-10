#!/bin/bash

main() {
  cd $(dirname "$0")/..

  mkdir -p ~/.config

  # vim
  mkdir -p ~/.vim
  ln -f vim/vimrc ~/.vim
  ln -f vim/colorscheme.vim ~/.vim
  ln -f vim/remaps.vim ~/.vim
  ln -f vim/plugins.vim ~/.vim

  # lf
  mkdir -p ~/.config/lf
  ln -f lf/lfrc ~/.config/lf

  # tmux
  ln -f tmux/tmux.conf ~/.tmux.conf

  # shell
  ln -f shell/zshrc ~/.zshrc
  ln -f shell/bashrc ~/.bashrc
  ln -f shell/aliasrc ~/.config

  # ipython
  mkdir -p ~/.ipython/profile_default
  ln -f misc/ipython_config.py ~/.ipython/profile_default
  
  # alacritty
  mkdir -p ~/.config/alacritty
  ln -f alacritty/alacritty.yml ~/.config/alacritty

  cd -
}

main "$@"
