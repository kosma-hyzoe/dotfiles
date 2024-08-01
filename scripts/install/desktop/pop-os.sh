#!/bin/bash
source "$(dirname "$0")/header"


FLATPAK="tidal keepassxc qbittorrent libreoffice"
APT_PROGRAMS="gnome-software-plugin-flatpak"
CARGO_PROGRAMS="tealdeer tree-sitter-cli"
PIPX_PROGRAMS="pynvim"

ill $APT_PROGRAMS

EXT_PKGM="cargo install --locked"
source "$(dirname "${0}")/header"
ill "$CARGO_PROGRAMS"

# pip/pipx
command -v pipx &>/dev/null || \
    python3 -m pip install --user pipx \
    pipx ensurepath > /dev/null

EXT_PKGM="pipx install --user --upgrade"
source "$(dirname "${0}")/header"
ill "$PIPX_PROGRAMS"

sudo flatpak remote-add --if-not-exists \
    flathub https://flathub.org/repo/flathub.flatpakrepo

# syncthing preconfig
if ! command -v syncthing &>/dev/null; then
    sudo mkdir -p /etc/apt/keyrings
    sudo curl -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
    echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
    sudo apt-get update
    ill syncthing
fi

ill "$APT"

flatpak install "$FLATPAK"

