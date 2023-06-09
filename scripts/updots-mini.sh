#!/bin/bash

main() {
  cd $(dirname "$0")/..

  git_pull_output=$(git pull)
  [[ !$? ]] && [[ "${git_pull_output}" != "Already up to date." ]] && exit 1

  mkdir -p ~/.local/scripts
  cp -f scripts/updots-mini.sh ~/.local/scripts

  mkdir -p ~/.config

  # vim
  mkdir -p ~/.vim
  mkdir -p ~/.config/nvim
  ln -f vim/vimrc ~/.vimrc
  ln -f vim/bindings.vim ~/.vim
  ln -f vim/plugins.vim ~/.vim

  # lf
  mkdir -p ~/.config/lf
  ln -f lf/lfrc ~/.config/lf

  # shell
  ln -f shell/bashrc ~/.bashrc
  ln -f shell/aliasrc ~/.config
  ln -f shell/shortcutrc ~/.config
  ln -f shell/tempshrc ~/.config

}

main "$@"
