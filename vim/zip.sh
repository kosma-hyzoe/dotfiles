#!/usr/bin/bash

cat vimrc | sed '1,3d'
echo -ne '\n"""""""""""""""""""""""""""""""""""" REMAPS """"""""""""""""""""""""""""""""""""\n\n'
cat remaps.vim
