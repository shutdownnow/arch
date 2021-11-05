#!/bin/sh
pacman -Sy git --noconfirm && cp config/gitconfig ~/.gitconfig && cp config/git-credentials ~/.git-credential
