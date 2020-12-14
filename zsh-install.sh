#!/bin/bash

sudo pacman -Sy
sudo pacman -S zsh zsh-syntax-highlighting --noconfirm
cp ./config/zshrc ~/.zshrc

exit 0
