#!/bin/bash

pacman -Sy
pacman -S zsh zsh-syntax-highlighting --noconfirm
cp config/zshrc /etc/zsh

exit 0
