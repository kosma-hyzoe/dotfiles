#!/bin/bash

source "$(dirname "${0}")/../header"

DEPENDENCIES="build-essential"
CARGO_PROGRAMS="bat exa zoxide ripgrep fd-find fcp" \
    "tealdeer tree-sitter-cli"

ill $DEPENDENCIES

# cargo
if ! command -v cargo &>/dev/null; then
    curl https://sh.rustup.rs -sSf | sh
fi

EXT_PKGM="cargo install --locked"
source "$(dirname "${0}")/../header"
ill "$CARGO_PROGRAMS"

EXT_PKGM="pipx install --user --upgrade"
source "$(dirname "${0}")/../header"
ill "$PIPX_PROGRAMS"

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

# gh
if ! command -v gh &>/dev/null && command -v apt &>/dev/null; then
    (type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
    && sudo mkdir -p -m 755 /etc/apt/keyrings \
    && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
    && sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y
fi
