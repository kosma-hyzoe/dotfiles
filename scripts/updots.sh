#!/bin/bash

main() {
  cd $(dirname "$0")/..
  echo $(pwd)
  exit

  git pull &> /dev/null || { echo "git pull failed. exiting..." && exit 1; }

  mkdir -p ~/.config

  # vim
  mkdir -p ~/.vim
  mkdir -p ~/.config/nvim
  ln -f vim/vimrc ~/.vimrc
  ln -f vim/init.vim ~/.config/nvim
  ln -f vim/bindingrc ~/.vim
  ln -f vim/pluginrc ~/.vim

  # code
  ln -f vscode/vscodevimrc ~/.vscodevimrc

  # jebtrains
  ln -f jetbrains/ideavimrc ~/.ideavimrc

  # lf
  mkdir -p ~/.config/lf
  ln -f lf/lfrc ~/.config/lf

  # alacritty
  ln -f alacritty/alacritty.yml ~/.config/alacritty

  # tmux
  ln -f tmux/tmux.conf ~/.tmux.conf

  # shell
  ln -f shell/zshrc ~/.zshrc
  ln -f shell/aliasrc ~/.config
  ln -f shell/shortcutrc ~/.config
  ln -f shell/tempshrc ~/.config

  # ipython
  mkdir -p ~/.ipython/profile_default
  ln -f misc/ipython_config.py ~/.ipython/profile_default
}

main "$@"
