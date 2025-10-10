#!/bin/bash

source "$(dirname "${0}")/../header"

CARGO_PROGRAMS="bat eza zoxide ripgrep fd-find tree-sitter-cli du-dust"
APT_PROGRAMS="duf"

ill $APT_PROGRAMS

# cargo
if ! command -v cargo &>/dev/null; then
"$(dirname "${0}")/cargo.sh"
fi

EXT_PKGM="cargo install --locked"
source "$(dirname "${0}")/../header"
ill "$CARGO_PROGRAMS"
