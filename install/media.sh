#!/usr/bin/bash

# mpd mpv vlc ffmpeg yt-dlp
# nicotine+ spotify qbittorrent

NCMPCPP_APT_DEPENDENCIES=("libncurses5-dev")
BOOST_DWNLD_URL="https://www.boost.org/users/history/version_1_82_0.html"
APT_PROGRAMS=("zathura" "mpv" "vlc" "transmission")

FLATPAK=("qbittorrent" "spotify" "nicotine+" "klavaro")



install() {
  if ! command -v "${1}" &>/dev/null; then
    echo "Installing ${1}"...
    sudo apt-get install -y "${1}" >/dev/null
  fi
}

main() {
    # ncmpcpp
    mkdir -p ~/.local/boost
    cd ~/.local/boost
    wget $BOOST_DWNLD_URL
    tar --bzip2 -xf *.tar.bz2
}
