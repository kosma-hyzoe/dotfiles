#!/bin/bash

source $(dirname "$0")/header

DEPENDENCIES="pipx build-essential"
CARGO_PROGRAMS="bat exa zoxide ripgrep tree-sitter-cli tealdeer fd-find"
PIPX_PROGRAMS="speedtest-cli trash-cli pynvim"

ill $DEPENDENCIES
pipx ensurepath > /dev/null || echo "Failed to setup pipx"

## CARGO
if ! command -v cargo &>/dev/null; then
    curl https://sh.rustup.rs -sSf | sh
    source "$HOME/.cargo/env"
fi


EXT_PKGM="cargo install --locked"
source $(dirname "$0")/header
ill $CARGO_PROGRAMS

# for pip
EXT_PKGM="pipx install --user --upgrade"
source $(dirname "$0")/header
ill $PIP_PROGRAMS
