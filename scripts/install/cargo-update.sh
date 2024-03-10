#!/usr/bin/bash
source $(dirname "$0")/header

DEPS="cmake libgit2-dev libssh-dev libssl-dev pkgconf libssl-dev"

ill $DEPS

cargo install cargo-update
