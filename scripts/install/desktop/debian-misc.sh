sudo apt remove libreoffice-common libreoffice-core libreoffice-gnome \
  libreoffice-gtk3 libreoffice-help-common libreoffice-he \
  lp-en-us libreoffice-style-colibre libreoffice-style-elementar \
  firefox-esr
sudo apt install aptitude


echo "deb http://deb.debian.org/debian bookworm-backports main" \
  | sudo tee /etc/apt/sources.list.d/backports.list
