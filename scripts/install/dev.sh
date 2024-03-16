#!/usr/bin/bash

C="clangd"
KERNEL="lzop gcc-arm-linux-gnueabi libssl-dev bison flex"
JAVA="openjdk-17-jdk"
STM32="stm32pio"

if ! command -v pio &>/dev/null; then
    curl -fsSL -o get-platformio.py https://raw.githubusercontent.com/platformio/platformio-core-installer/master/get-platformio.py
    python3 get-platformio.py
    ln -s ~/.platformio/penv/bin/platformio ~/.local/bin/platformio
    ln -s ~/.platformio/penv/bin/pio ~/.local/bin/pio
    ln -s ~/.platformio/penv/bin/piodebuggdb ~/.local/bin/piodebuggdb
fi
