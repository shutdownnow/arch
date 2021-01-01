#!/bin/bash

pacman -Sy
pacman -S alacritty rofi acpi --noconfirm

cd ./software/dmenu
make clean install
make clean
cd ../st
make clean install
make clean
cd ../dwm
make clean install
make clean

exit 0
