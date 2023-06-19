#!/bin/bash

CARGO_PROGRAMS=("bat" "tealdeer" "exa" "cargo-update" "ripgrep" "exa")

main() {
  # cargo
  if ! command -v cargo &>/dev/null; then
    curl https://sh.rustup.rs -sSf | sh
    # shellcheck source=/dev/null
    source "$HOME/.cargo/env"
  fi

  for prog in "${CARGO_PROGRAMS[@]}"; do
    if ! command -v prog &>/dev/null; then
      echo "Installing ${prog}"...
      cargo install "${1}" >/dev/null
    fi
  done

  # fzf
  if ! command -v fzf &>/dev/null; then
      git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
      ~/.fzf/install
  fi
}

main "$@"
