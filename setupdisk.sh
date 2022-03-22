#!/bin/sh
ARCH_DISK="$1"
ARCH="$2"
ARCH_EFI="$3"

umount -R "${ARCH}" "${ARCH_EFI}"

fdisk "$ARCH_DISK" << "EOF"
g
n
1

+512M
t
1
n
2


t
2
23
w
EOF

mkfs -t vfat -I "${ARCH_DISK}"p1
mkfs -t f2fs -f "${ARCH_DISK}"p2

mkdir -pv "${ARCH}"
mount "${ARCH_DISK}p2" "$ARCH"
mkdir -pv "${ARCH_EFI}"
mount "${ARCH_DISK}p1" "$ARCH_EFI"
