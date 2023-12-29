#!/usr/bin/bash

source $(dirname "$0")/header

sudo flatpak remote-add --if-not-exists \
    flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub org.wezfurlong.wezterm

# chromium
ill chromium
sudo apt remove firefox-esr

# multimedia
ill vlc libavcodec-extra

sudo apt remove libreoffice-common libreoffice-core libreoffice-gnome \
  libreoffice-gtk3 libreoffice-help-common libreoffice-he \
  lp-en-us libreoffice-style-colibre libreoffice-style-elementary

ill flatpak gnome-software-plugin-flatpak
flatpak install \
    spotify keepassxc qbittorrent libreoffice stretchly


# syncthing
sudo curl -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing candidate" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo apt-get update
sudo apt-get install syncthing

# appearance
ill neofetch

sudo sh -c "echo 'deb http://ppa.launchpad.net/papirus/papirus/ubuntu jammy main' > /etc/apt/sources.list.d/papirus-ppa.list"
sudo wget -qO /etc/apt/trusted.gpg.d/papirus-ppa.asc 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x9461999446FAF0DF770BFC9AE58A9D36647CAE7F'
sudo apt-get update
ill papirus-icon-theme

git clone https://github.com/horst3180/arc-theme.git
cd arc-theme
./autogen.sh --prefix=/usr --disable-cinnamon --disable-metacity \
  --disable-xfwm --disable-unity --with-gnome=3.22
sudo make install && cd .. && rm arc-theme
