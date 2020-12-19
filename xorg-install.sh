#!/bin/bash

pacman -Sy
pacman -S xorg xorg-server xorg-apps xorg-xinit xorg-xrandr nvidia xf86-video-intel --noconfirm

exit 0
