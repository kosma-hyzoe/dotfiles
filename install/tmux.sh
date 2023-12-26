#!/usr/bin/bash

source $(dirname "$0")/header
TMUX_DOWNLOAD_LINK="https://github.com/tmux/tmux/releases/download/3.3a/tmux-3.3a.tar.gz"

ill libevent-dev ncurses-dev build-essential bison pkg-config

wget $TMUX_DOWNLOAD_LINK
tar xf tmux-*
rm -rf tmux-*tar.gz
cd tmux-*
./configure && make
sudo make install && cd .. && rm -rf tmux-*
