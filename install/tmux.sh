#!/usr/bin/bash

source $(dirname "$0")/header

ill libevent-dev libncurses5-dev

git clone https://github.com/tmux/tmux
cd tmux
./configure && make
sudo make install
cd ..
