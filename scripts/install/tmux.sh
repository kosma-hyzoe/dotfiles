#!/usr/bin/bash

# command -v tmux $> /dev/null  || echo "tmux already installed." ; exit 1

source "$(dirname "$0")"/header

TMUX_DOWNLOAD_LINK="https://github.com/tmux/tmux/releases/download/3.4/tmux-3.4.tar.gz"

ill "libevent-dev ncurses-dev build-essential bison pkg-config"

wget $TMUX_DOWNLOAD_LINK
tar xf tmux-*
rm -rf tmux-*tar.gz
cd tmux-* || exit 1
./configure && make
sudo make install && cd .. && rm -rf tmux-*
