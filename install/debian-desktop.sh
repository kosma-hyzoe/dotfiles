#!/usr/bin/bash

FLATPAK="spotify keepassxc qbittorrent libreoffice stretchly"
APT="chromium vlc libavcodec-extra flatpak gnome-software-plugin-flatpak syncthing neofetch"

source $(dirname "$0")/header

# remove legacy libreoffice and firefox
sudo apt remove libreoffice-common libreoffice-core libreoffice-gnome \
  libreoffice-gtk3 libreoffice-help-common \
  libreoffice-style-colibre libreoffice-style-elementary \
  firefox-esr

sudo flatpak remote-add --if-not-exists \
    flathub https://flathub.org/repo/flathub.flatpakrepo

# syncthing preconfig
sudo curl -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing candidate" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo apt-get update

ill $APT

flatpak install $FLATPAK

# papirus
wget -qO- https://git.io/papirus-icon-theme-install | sh
