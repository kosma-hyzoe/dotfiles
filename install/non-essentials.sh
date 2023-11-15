#!/bin/bash

source $(dirname "$0")/header

CARGO_PROGRAMS=("bat" "alacritty" "exa" "cargo-update" "ripgrep" \
  "teeldear" "zoxide" "tree-sitter-cli")
# "git-delta" "duf" "dust" "procs" "sd" "du" "bandwhich"

# cargo
if ! command -v cargo &>/dev/null; then
curl https://sh.rustup.rs -sSf | sh
# shellcheck source=/dev/null
source "$HOME/.cargo/env"
fi

# for cargo-update
ill libssl-dev

# programs from cargo
for prog in "${CARGO_PROGRAMS[@]}"; do
if ! command -v prog &>/dev/null; then
  echo "Installing ${prog}"...
  cargo install "${prog}" >/dev/null
fi
done

