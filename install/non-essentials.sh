#!/bin/bash

source $(dirname "$0")/header

DEPENDENCIES="libssl-dev pipx"
CARGO_PROGRAMS="bat exa zoxide cargo-update ripgrep tree-sitter-cli fd teeldeer"
PIPX_PROGRAMS="speedtest-cli trash-cli pynvim"

ill $DEPENDENCIES
pipx ensurepath $> /dev/null || echo "Failed to setup pipx"

## CARGO
if ! command -v cargo &>/dev/null; then
    curl https://sh.rustup.rs -sSf | sh
    source "$HOME/.cargo/env"
fi


EXT_PKGM="cargo install"
source $(dirname "$0")/header
ill $CARGO_PROGRAMS

# for pip
EXT_PKGM="pip install --user --upgrade"
source $(dirname "$0")/header
ill $PIP_PROGRAMS
