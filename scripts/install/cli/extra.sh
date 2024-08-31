#!/bin/bash

source "$(dirname "${0}")/../header"

CARGO_PROGRAMS="bat exa zoxide ripgrep fd-find tree-sitter-cli"

ill $DEPENDENCIES

# cargo
if ! command -v cargo &>/dev/null; then
    curl https://sh.rustup.rs -sSf | sh
fi

EXT_PKGM="cargo install --locked"
source "$(dirname "${0}")/../header"
ill "$CARGO_PROGRAMS"


# npm
if ! command -v npm &>/dev/null; then
    if [[ $(uname -a) == *"Debian"* ]]; then
        echo -n -e "run this as root to install npm:" \
            "\n\tcurl -fsSL https://deb.nodesource.com/setup_lts.x |" \
            "bash - && apt-get install -y nodejs"
    else
        curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - &&\
        sudo apt-get install -y nodejs
    fi
fi

