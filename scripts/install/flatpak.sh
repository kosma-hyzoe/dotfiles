sudo apt install flatpak

sudo flatpak remote-add --if-not-exists \
    flathub https://flathub.org/repo/flathub.flatpakrepo

sudo apt install gnome-software-plugin-flatpak gnome-software
flatpak install tidal jellyfin

