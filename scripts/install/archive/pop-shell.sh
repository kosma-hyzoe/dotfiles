#!/bin/bash

source $(dirname "$0")/header

ill node-typescript make
git clone https://github.com/pop-os/shell.git ~/shell
cd ~/shell
make local-install
