#!/bin/bash
pacman -Sy
pacman -S wpa_supplicant --noconfirm

cp config/wpa_supplicant-wlp0s20f3.conf /etc/wpa_supplicant
