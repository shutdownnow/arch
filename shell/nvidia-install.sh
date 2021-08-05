#!/bin/bash

pacman -Sy
pacman -S nvidia xf86-video-intel --noconfirm

git clone https://aur.archlinux.org/nvidia-xrun
cd nvidia-xrun
makepkg -i --noconfirm
cat ../config/nvidia-xinitrc >> /etc/X11/xinit/nvidia-xinitrc
touch ~/.nvidia-xinitrc

exit 0
