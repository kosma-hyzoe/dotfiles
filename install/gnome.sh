gsettings set org.gnome.desktop.peripherals.keyboard delay 200 # originally 300
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 15 # originally 20
gsettings set org.gnome.desktop.interface enable-animations false

# sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which alacritty)
# sudo update-alternatives --config x-terminal-emulator