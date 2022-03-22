#!/bin/sh
sudo pacman -Sy nvidia nvidia-settings --noconfirm

sudo tee /etc/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf << "EOF"
Section "OutputClass"
    Identifier "intel"
    MatchDriver "i915"
    Driver "modesetting"
EndSection

Section "OutputClass"
    Identifier "nvidia"
    MatchDriver "nvidia-drm"
    Driver "nvidia"
    Option "AllowEmptyInitialConfiguration"
    Option "PrimaryGPU" "yes"
    ModulePath "/usr/lib/nvidia/xorg"
    ModulePath "/usr/lib/xorg/modules"
EndSection
EOF
