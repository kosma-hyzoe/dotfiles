#!/bin/bash

main() {
  cd $(dirname "$0")/..

  git_pull_output=$(git pull)
  [[ !$? ]] && [[ "${git_pull_output}" != "Already up to date." ]] && exit 1

  mkdir -p ~/.local/scripts
  cp -f scripts/* ~/.local/scripts

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

  # tmux, with a workaround for my Ubuntu 20.04 virtual machine
  [[ $(tmux -V) != "tmux 3.0a" ]] && ln -f tmux/tmux.conf ~/.tmux.conf

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
