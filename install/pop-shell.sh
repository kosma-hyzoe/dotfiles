#!/usr/bin/bash

sudo apt install git node-typescript make
git clone https://github.com/pop-os/shell.git ~/shell
cd ~/shell
make local-install
