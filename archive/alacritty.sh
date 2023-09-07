#!/bin/bash

ALACRITTY_DEPENDENCIES=("cmake" "pkg-config" "libfreetype6-dev" "libfontconfig1-dev" "libxcb-xfixes0-dev" "libxkbcommon-dev" "python3")
ALACRITTY_THEMES_REPO_URL="https://github.com/alacritty/alacritty-theme"

install() {
  if ! command -v "${1}" &>/dev/null; then
    echo "Installing ${1}"...
    sudo apt-get install -y "${1}" >/dev/null
  fi
}

install_alacritty_dependencies() {
  for prog in "${ALACRITTY_DEPENDENCIES[@]}"; do
    install "${prog}"
  done
}

main() {
  if ! command -v alacritty &>/dev/null; then
    echo "Installing alacritty..."
    install_alacritty_dependencies
    cargo install alacritty >/dev/null
  fi
  mkdir -p ~/.config/alacritty/themes
  git clone ${ALACRITTY_THEMES_REPO_URL} ~/.config/alacritty/themes 2>/dev/null
}

main "$@"

