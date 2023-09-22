#!/bin/bash

CARGO_PROGRAMS=("bat" "alacritty" "exa" "cargo-update" "ripgrep" \
  "teeldear" "zoxide")
# "git-delta" "duf" "dust" "procs" "sd" "du" "bandwhich"

# cargo
if ! command -v cargo &>/dev/null; then
curl https://sh.rustup.rs -sSf | sh
# shellcheck source=/dev/null
source "$HOME/.cargo/env"
fi

# programs from cargo
for prog in "${CARGO_PROGRAMS[@]}"; do
if ! command -v prog &>/dev/null; then
  echo "Installing ${prog}"...
  cargo install "${prog}" >/dev/null
fi
done

# set alacritty as default
sudo update-alternatives --install /usr/bin/x-terminal-emulator \
    x-terminal-emulator $(which alacritty) 50
sudo update-alternatives --config x-terminal-emulator

