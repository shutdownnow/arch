#!/bin/sh
ARCH_DISK=/dev/nvme0n1
ARCH=/mnt/arch
ARCH_EFI=${ARCH}/efi
ARCH_TYPE=$(cat < /proc/cpuinfo | grep 'model name' | uniq | awk -F' ' '{print $4}' | tr "[:upper:]" "[:lower:]")

./setupdisk.sh $ARCH_DISK $ARCH $ARCH_EFI

systemctl stop reflector.service
cat > /etc/pacman.d/mirrorlist << "EOF"
Server = http://mirrors.bfsu.edu.cn/archlinux/$repo/os/$arch
Server = https://mirrors.bfsu.edu.cn/archlinux/$repo/os/$arch
EOF

sed "s/#\(Parallel\)/\1/" -i /etc/pacman.conf
timedatectl set-ntp true

BASEPKG="base linux linux-firmware base-devel dhcpcd vim f2fs-tools bash-completion"
pacstrap $ARCH "${BASEPKG}" "${ARCH_TYPE}-ucode"
genfstab -U $ARCH >> $ARCH/etc/fstab
arch-chroot $ARCH bash -c chroot.sh $ARCH_EFI
