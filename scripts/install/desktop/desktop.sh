
# papirus
wget -qO- https://git.io/papirus-icon-theme-install | sh
cp usr/share/applications/syncthing-start.desktop ~/.config/autostart


sudo flatpak remote-add --if-not-exists \
    flathub https://flathub.org/repo/flathub.flatpakrepo

sudo apt install timeshift exfatprogs vlc \
    libavcodec-extra flatpak
flatpak install tidal keepassxc libreoffice


