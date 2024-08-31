
# papirus
wget -qO- https://git.io/papirus-icon-theme-install | sh
cp usr/share/applications/syncthing-start.desktop ~/.config/autostart


if ! command -v syncthing &>/dev/null; then
    sudo mkdir -p /etc/apt/keyrings
    sudo curl -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
    echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
    sudo apt-get update
    sudo apt install syncthing
fi

sudo flatpak remote-add --if-not-exists \
    flathub https://flathub.org/repo/flathub.flatpakrepo

sudo apt install timeshift exfatprogs vlc kitty  \
    libavcodec-extra flatpak gnome-software-plugin-flatpak
flatpak install tidal keepassxc libreoffice


