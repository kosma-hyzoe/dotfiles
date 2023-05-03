#!/bin/bash

# TODO pop shell

ALACRITTY_DEPENDENCIES=("cmake" "pkg-config" "libfreetype6-dev" "libfontconfig1-dev" "libxcb-xfixes0-dev" "libxkbcommon-dev" "python3")
ALACRITTY_THEMES_REPO_URL="https://github.com/alacritty/alacritty-theme"

install() {
  if ! command -v "${1}" &>/dev/null; then
    echo "Installing ${1}"...
    sudo apt-get install -y "${2}" >/dev/null
  fi
}

install_alacritty_dependencies() {
  for prog in "${ALACRITTY_DEPENDENCIES[@]}"; do
    install "${prog}"
  done
}

main() {
  # alacritty
  if ! command -v alacritty &>/dev/null; then
    # install cargo if needed
    if ! command -v cargo &>/dev/null; then
      curl https://sh.rustup.rs -sSf | sh
      # shellcheck source=/dev/null
      source "$HOME/.cargo/env"
    fi
    echo "Installing alacritty..."
    install_alacritty_dependencies
    cargo install alacritty >/dev/null
  fi
  mkdir -p ~/.config/alacritty/themes
  git clone ${ALACRITTY_THEMES_REPO_URL} ~/.config/alacritty/themes 2>/dev/null
}

main "$@"