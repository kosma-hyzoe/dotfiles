#!/usr/bin/bash

source $(dirname "$0")/header

FLATPAK_PROGRAMS=(\
    spotify qbittorrent \
    okular keepassxc \
    klavaro \
)

APT_PROGRAMS=(vlc neofetch)

ill flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

for prog in "${FLATPAK_PROGRAMS[@]}"; do
  flatpak install -y "${prog}"
done
