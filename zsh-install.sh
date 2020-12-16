#!/bin/bash

sudo pacman -Sy
sudo pacman -S zsh zsh-syntax-highlighting --noconfirm
cp ./config/zshrc ~/.zshrc
cp ./config/zprofile ~/.zprofile
source ~/.zshrc

exit 0
