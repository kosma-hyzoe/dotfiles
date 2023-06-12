#!/bin/bash

main() {
  cd $(dirname "$0")/..

  git_pull_output=$(git pull)
  [[ !$? ]] && [[ "${git_pull_output}" != "Already up to date." ]] && exit 1

  mkdir -p ~/.config

  # vim
  mkdir -p ~/.vim
  mkdir -p ~/.config/nvim
  ln -f vim/vimrc ~/.vimrc
  ln -f vim/init.vim ~/.config/nvim
  ln -f vim/bindings.vim ~/.vim
  ln -f vim/plugins.vim ~/.vim

  # code
  ln -f vscode/vscodevimrc ~/.vscodevimrc

  # jebtrains
  ln -f jetbrains/ideavimrc ~/.ideavimrc

  # lf
  mkdir -p ~/.config/lf
  ln -f lf/lfrc ~/.config/lf

  # tmux, with a workaround for my Ubuntu 20.04 virtual machine
  [[ $(tmux -V) != "tmux 3.0a" ]] && ln -f tmux/tmux.conf ~/.tmux.conf

  # shell
  ln -f shell/zshrc ~/.zshrc
  cp -f shell/bashrc ~/.bashrc
  ln -f shell/aliasrc ~/.config

  # ipython
  mkdir -p ~/.ipython/profile_default
  ln -f misc/ipython_config.py ~/.ipython/profile_default
}

main "$@"
