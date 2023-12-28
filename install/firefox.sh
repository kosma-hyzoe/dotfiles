#!/usr/bin/bash


ls firefox-*.tar.bz2 &> /dev/null || \
    echo "you need to place this script next to a firefox *.tar.bz2 archive to run it." \
    ; exit 1
tar xjf firefox-*.tar.bz2
rm firefox-*.tar.bz2
sudo mv firefox /opt
sudo ln -s /opt/firefox/firefox /usr/local/bin/firefox
sudo wget https://raw.githubusercontent.com/mozilla/sumo-kb/main/install-firefox-linux/firefox.desktop \
  -P /usr/local/share/applications

sudo apt install libdbus-glib-1-dev

