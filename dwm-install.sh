#!/bin/bash

pacman -Syu --noconfirm
pacman -S alacritty

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
