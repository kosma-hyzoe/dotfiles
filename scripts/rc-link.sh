#!/bin/bash

main() {
  cd $(dirname "$0")/..

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
  [[ $(uname -v) != *Ubuntu* ]] &>/dev/null && \
      ln -f tmux/tmux.conf ~/.tmux.conf || \
      ln -f tmux/corp-tmux.conf ~/.tmux.conf

  # shell
  ln -f shell/zshrc ~/.zshrc
  ln -f shell/bashrc ~/.bashrc
  ln -f shell/aliasrc ~/.config

  # ipython
  mkdir -p ~/.ipython/profile_default
  ln -f misc/ipython_config.py ~/.ipython/profile_default

  # alacritty
  ln -f wezterm.lua ~/.wezterm.lua

  cd - > /dev/null
}

main "$@"
