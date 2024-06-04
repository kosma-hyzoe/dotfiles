#!/bin/bash
source "$(dirname "$0")/header"


FLATPAK="tidal keepassxc qbittorrent libreoffice stretchly"
APT_PROGRAMS="timeshift chromium-browser vlc kitty libavcodec-extra flatpak barrier gnome-software-plugin-flatpak syncthing neofetch"
CARGO_PROGRAMS="duf tealdeer tree-sitter-cli"
PIPX_PROGRAMS="speedtest-cli pynvim"

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
sudo mkdir -p /etc/apt/keyrings
sudo curl -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo apt-get update

ill "$APT"

flatpak install "$FLATPAK"

# papirus
wget -qO- https://git.io/papirus-icon-theme-install | sh
cp usr/share/applications/syncthing-start.desktop ~/.config/autostart

# nerdfonts
curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash
getnf -i NerdFontsSymbolsOnly
