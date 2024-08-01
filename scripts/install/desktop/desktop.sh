FLATPAK="tidal keepassxc qbittorrent libreoffice stretchly"
APT_PROGRAMS="timeshift exfatprogs chromium-browser vlc kitty libavcodec-extra flatpak gnome-software-plugin-flatpak neofetch python3-pynvim"

# papirus
wget -qO- https://git.io/papirus-icon-theme-install | sh
cp usr/share/applications/syncthing-start.desktop ~/.config/autostart

# nerdfonts
curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash
getnf -i NerdFontsSymbolsOnly

