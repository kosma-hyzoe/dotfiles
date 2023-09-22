#!/usr/bin/bash

tar xjf firefox-*.tar.bz2
rm firefox-*.tar.bz2
sudo mv firefox /opt
sudo ln -s /opt/firefox/firefox /usr/local/bin/firefox
sudo wget https://raw.githubusercontent.com/mozilla/sumo-kb/main/install-firefox-linux/firefox.desktop \
  -P /usr/local/share/applications
