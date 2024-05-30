#!/bin/bash

cat vimrc | sed '1,3d'
echo -ne '\n"""""""""""""""""""""""""""""""""""" REMAPS """"""""""""""""""""""""""""""""""""\n\n'
cat remaps.vim
echo -ne '\n"""""""""""""""""""""""""""""""""""" PLUGINS """"""""""""""""""""""""""""""""""""\n\n'
cat plugins.vim
