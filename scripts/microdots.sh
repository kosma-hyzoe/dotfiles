#!/bin/bash

# minimal vim, lf and bash configs for environments without sudo permissions

LF_DOWNLOAD_URL="https://github.com/gokcehan/lf/releases/download/r30/lf-linux-amd64.tar.gz"

main() {
  mkdir -p ~/.config ~/.local/bin

  # vim
  mkdir -p ~/.vim
  cp -f vim/vimrc ~/.vimrc
  cp -f vim/bindings.vim ~/.vim
  cp -f vim/plugins.vim ~/.vim

  # lf
  if ! command -v lf &>/dev/null; then
    wget ${LF_DOWNLOAD_URL}
    tar -xvzf lf*.tar.gz -C ~/.local/bin
    rm -f lf*.tar.gz
  fi
  mkdir -p ~/.config/lf
  cp -f lf/lfrc ~/.config/lf

  # shell
  cp -f shell/bashrc ~/.bashrc
  cp -f shell/aliasrc ~/.config
}

main "$@"
