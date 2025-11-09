#!/bin/bash

sed '1,3d' ~/.dotfiles/vim/vimrc
echo -ne '\n"""""""""""""""""""""""""""""""""""" REMAPS """""""""""""""""""""""""""""""""""""\n\n'
cat ~/.dotfiles/vim/remaps.vim
# echo -ne '\n"""""""""""""""""""""""""""""""""""" PLUGINS """"""""""""""""""""""""""""""""""""\n\n'
# cat ~/.dotfiles/vim/plugins.vim
