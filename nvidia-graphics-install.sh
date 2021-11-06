#!/bin/sh
pacman -S nvidia nvidia-settings lib32-nvidia-utils --noconfirm
cp config/10-nvidia-drm-outputclass.conf /etc/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf
