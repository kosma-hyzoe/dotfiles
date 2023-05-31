#!/bin/bash

# faster hjkl-ing around
gsettings set org.gnome.desktop.peripherals.keyboard delay 200 # originally 300
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 15 # originally 20

chsh -s "$(which zsh)" "$(whoami)"

command -v gnome-control-center &> /dev/null || sudo apt install gnome-control-center
