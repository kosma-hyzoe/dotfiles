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
  ln -f lfrc ~/.config/lf


  # tmux
  if [[ $(uname -v) != *Ubuntu* ]] &>/dev/null; then
      ln -f tmux/tmux.conf ~/.tmux.conf
  elif [[ $(uname -r) != *5.15* ]] &>/dev/null; then
      ln -f tmux/corp-tmux.conf ~/.tmux.conf
  else
      ln -f tmux/bs-tmux.conf ~/.tmux.conf
  fi

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
