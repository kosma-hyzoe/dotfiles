#!/bin/bash

cd "$(dirname "$0")/.." || exit
mkdir -p "$HOME/.local/scripts"
mkdir  -p "$HOME/.config"

# less
ln -f config/lessrc "$HOME/.config"

# vim
if command -v vim >/dev/null; then
    mkdir -p "$HOME/.vim"
    ln -f vim/vimrc "$HOME/.vim"
    ln -f vim/remaps.vim "$HOME/.vim"
    ln -f vim/plugins.vim "$HOME/.vim"
fi

# lf
if command -v lf >/dev/null; then
    mkdir -p "$HOME/.config/lf"
    ln -f lf/lfrc "$HOME/.config/lf"
    # ln -f lf/lf_kitty_preview "$HOME/.local/scripts"
    # ln -f lf/lf_kitty_clean "$HOME/.local/scripts"
    # ln -f lf/_lfip "$HOME/.local/scripts"
fi

# shell
ln -f shell/bashrc "$HOME/.bashrc"
ln -f shell/aliasrc "$HOME/.config"
ln -f shell/st "$HOME/.local/scripts"
command -v zsh >/dev/null && ln -f shell/zshrc "$HOME/.zshrc"

# tmux
command -v tmux >/dev/null && ln -f tmux/tmux.conf "$HOME/.tmux.conf"

# python
mkdir -p "$HOME/.ipython/profile_default"
ln -f python/ipython_config.py "$HOME/.ipython/profile_default"
ln -f python/flake8 "$HOME/.config"

# kitty
if command -v kitty >/dev/null; then
    mkdir -p "$HOME/.config/kitty"
    ln -f config/kitty.conf "$HOME/.config/kitty"
fi

# zathura
if command -v zathura >/dev/null; then
    mkdir -p "$HOME/.config/zathura"
    ln -f config/zathurarc "$HOME/.config/zathura/zathurarc"
fi

cd - > /dev/null || exit
