#!/usr/bin/bash

FLATPAK="spotify keepassxc qbittorrent libreoffice stretchly"
source $(dirname "$0")/header

sudo flatpak remote-add --if-not-exists \
    flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub org.wezfurlong.wezterm

# browsers
ill chromium
sudo apt remove firefox-esr
./firefox.sh

# multimedia
ill "vlc libavcodec-extra"

sudo apt remove libreoffice-common libreoffice-core libreoffice-gnome \
  libreoffice-gtk3 libreoffice-help-common libreoffice-he \
  lp-en-us libreoffice-style-colibre libreoffice-style-elementary

ill "flatpak gnome-software-plugin-flatpak"
flatpak install $FLATPAK


# syncthing
sudo curl -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing candidate" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo apt-get update
sudo apt-get install syncthing

# appearance
ill neofetch
wget -qO- https://git.io/papirus-icon-theme-install | sh
