#!/bin/bash

pacman -Sy
pacman -S xorg xorg-xinit nvidia xf86-video-intel --noconfirm

exit 0
