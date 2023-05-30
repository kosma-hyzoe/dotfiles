gsettings set org.gnome.desktop.default-applications.terminal exec gnome-terminal
# gsettings set org.gnome.desktop.default-applications.terminal exec-arg '-x'
sudo update-alternatives --remove "x-terminal-emulator" "$(which alacritty)"
