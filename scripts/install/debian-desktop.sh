#!/bin/bash
source "$(dirname "${0}")/header"

FLATPAK="tidal keepassxc qbittorrent libreoffice stretchly"
APT="timeshift chromium vlc libavcodec-extra flatpak barrier gnome-software-plugin-flatpak syncthing neofetch"


# remove legacy libreoffice and firefox
sudo apt remove libreoffice-common libreoffice-core libreoffice-gnome \
  libreoffice-gtk3 libreoffice-help-common libreoffice-he \
  lp-en-us libreoffice-style-colibre libreoffice-style-elementary \
  firefox-esr

sudo flatpak remote-add --if-not-exists \
    flathub https://flathub.org/repo/flathub.flatpakrepo

# syncthing preconfig
sudo mkdir -p /etc/apt/keyrings
sudo curl -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo apt-get update

ill $APT

flatpak install $FLATPAK

# papirus
wget -qO- https://git.io/papirus-icon-theme-install | sh
