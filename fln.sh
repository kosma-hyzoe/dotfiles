#!/usr/bin/bash

main() {
  mkdir -p ~/.config

  # vim
  mkdir -p ~/.vim
  mkdir -p ~/.config/nvim
  fn -f vim/vimrc ~/.vimrc
  fn -f vim/init.vim ~/.config/nvim
  fn -f vim/bindingrc ~/.vim
  fn -f vim/pluginrc ~/.vim
  fn -f vim/vscodevimrc ~/.vscodevimrc

  # lf
  mkdir -p ~/.config/lf
  fn -f lf/lfrc ~/.config/lf

  # alacritty
  fn -f alacritty/alacritty.yml ~/.config/alacritty

  # tmux
  fn -f tmux/tmux.conf ~/.tmux.conf

  # zsh
  fn -f zsh/zshrc ~/.zshrc
  fn -f zsh/aliasrc ~/.config
  fn -f zsh/shortcutrc ~/.config

  # ipython
  mkdir -p ~/.ipython/profile_default
  fn -f misc/ipython_config.py ~/.ipython/profile_default
}

main "$@"