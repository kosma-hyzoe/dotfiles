#!/bin/bash

cd "$(dirname "$0")/.." || exit
mkdir -p "$HOME/.local/scripts"
mkdir  -p "$HOME/.config"

# vim
mkdir -p "$HOME/.vim"
ln -f vim/vimrc "$HOME/.vim"
ln -f vim/remaps.vim "$HOME/.vim"
ln -f vim/plugins.vim "$HOME/.vim"

# lf
mkdir -p "$HOME/.config/lf"
ln -f lf/lfrc "$HOME/.config/lf"
ln -f lf/lf_kitty_preview "$HOME/.local/scripts"
ln -f lf/lf_kitty_clean "$HOME/.local/scripts"
ln -f lf/_lfip "$HOME/.local/scripts"

# tmux
[[ "$NESTED_TMUX" -eq 1 ]] && \
    ln -f tmux/nested-tmux.conf "$HOME/.tmux.conf" || \
    ln -f tmux/tmux.conf "$HOME/.tmux.conf"

# less
ln -f config/lessrc "$HOME/.config"

# shell
ln -f shell/zshrc "$HOME/.zshrc"
ln -f shell/bashrc "$HOME/.bashrc"
ln -f shell/aliasrc "$HOME/.config"

# python
mkdir -p "$HOME/.ipython/profile_default"
ln -f python/ipython_config.py "$HOME/.ipython/profile_default"
ln -f python/flake8 "$HOME/.config"

# kitty
mkdir -p "$HOME/.config/kitty"
ln -f config/kitty.conf "$HOME/.config/kitty"

cd - > /dev/null || exit
