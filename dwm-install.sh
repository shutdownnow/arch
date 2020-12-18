#!/bin/bash

sudo pacman -Syu --noconfirm
sudo pacman -S alacritty

cd ./software/dmenu
sudo make clean install
sudo make clean
cd ../st
sudo make clean install
sudo make clean
cd ../dwm
sudo make clean install
sudo make clean

exit 0
