#!/bin/bash

NESTED_TMUX=

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
  ln -f lfrc ~/.config/lf


  # tmux
  [[ $NESTED_TMUX -eq 1 ]] && \
      ln -f tmux/nested-tmux.conf ~/.tmux.conf || \
      ln -f tmux/tmux.conf ~/.tmux.conf

  # shell
  ln -f shell/zshrc ~/.zshrc
  ln -f shell/bashrc ~/.bashrc
  ln -f shell/aliasrc ~/.config
  ln -f shell/lessrc ~/.config

  # python
  mkdir -p ~/.ipython/profile_default
  ln -f python/ipython_config.py ~/.ipython/profile_default
  ln -f python/flake8 ~/.config

  # kitty
  mkdir -p ~/.config/kitty
  ln -f kitty.conf ~/.config/kitty

  cd - > /dev/null
}

main "$@"
