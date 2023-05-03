#!/bin/bash

# faster hjkl-ing around
gsettings set org.gnome.desktop.peripherals.keyboard delay 200 # originally 300
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 15 # originally 20

# set alacritty as default
if command -v alacritty &>/dev/null; then
  sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator "$(which alacritty)"
  sudo update-alternatives --config x-terminal-emulator
fi

chsh -s "$(which zsh)" "$(whoami)"