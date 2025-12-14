#!/bin/bash

cd "$(dirname "$0")/.." || exit
mkdir -p "$HOME/.local/scripts"
mkdir  -p "$HOME/.config"

# less
cp -f config/lessrc "$HOME/.config"

# vim
if command -v vim >/dev/null; then
    mkdir -p "$HOME/.vim"
    cp -f vim/vimrc "$HOME/.vim"
    cp -f vim/remaps.vim "$HOME/.vim"
    cp -f vim/plugins.vim "$HOME/.vim"
fi

# lf
if command -v lf >/dev/null; then
    mkdir -p "$HOME/.config/lf"
    cp -f config/lfrc "$HOME/.config/lf"
    # cp -f lf/lf_kitty_preview "$HOME/.local/scripts"
    # cp -f lf/lf_kitty_clean "$HOME/.local/scripts"
    # cp -f lf/_lfip "$HOME/.local/scripts"
fi

# shell
cp -f shell/bashrc "$HOME/.bashrc"
cp -f shell/aliasrc "$HOME/.config"
cp -f shell/st "$HOME/.local/scripts"
command -v zsh >/dev/null && cp -f shell/zshrc "$HOME/.zshrc"

# tmux
command -v tmux >/dev/null && ! [ -f ~/.tmux.conf ] \
    && cp -f tmux/tmux.conf "$HOME/.tmux.conf"

# python
mkdir -p "$HOME/.ipython/profile_default"
cp -f python/ipython_config.py "$HOME/.ipython/profile_default"
cp -f python/flake8 "$HOME/.config"

# kitty
if command -v kitty >/dev/null; then
    mkdir -p "$HOME/.config/kitty"
    cp -f config/kitty.conf "$HOME/.config/kitty"
fi

# zathura
if command -v zathura >/dev/null; then
    mkdir -p "$HOME/.config/zathura"
    cp -f config/zathurarc "$HOME/.config/zathura/zathurarc"
fi


# mpv
if command -v mpv >/dev/null; then
    cp -f config/mpv.conf "$HOME/.config/mpv.conf"
fi

cd - > /dev/null || exit
