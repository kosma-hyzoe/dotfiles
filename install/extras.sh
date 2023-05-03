#!/usr/bin/bash

alias fln

# ipython
command -v ipython &> /dev/null && fln misc/ipython_config.py ~/.ipython/profile_default

unalias fln