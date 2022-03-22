#!/bin/sh
ARCH_DISK=/dev/nvme0n1
ARCH=/mnt/arch
ARCH_EFI=${ARCH}/boot
ARCH_TYPE=$(cat < /proc/cpuinfo | grep 'model name' | uniq | awk -F' ' '{print $4}' | tr "[:upper:]" "[:lower:]")

./setupdisk.sh $ARCH_DISK $ARCH $ARCH_EFI

systemctl stop reflector.service
cat > /etc/pacman.d/mirrorlist << "EOF"
Server = http://mirrors.bfsu.edu.cn/archlinux/$repo/os/$arch
Server = https://mirrors.bfsu.edu.cn/archlinux/$repo/os/$arch
EOF

sed "s/#\(Parallel\)/\1/" -i /etc/pacman.conf
timedatectl set-ntp true

pacstrap $ARCH base linux linux-firmware base-devel dhcpcd vim f2fs-tools bash-completion "${ARCH_TYPE}-ucode"
genfstab -U $ARCH >> $ARCH/etc/fstab

cp init.sh ${ARCH}/root/init.sh
EFI=$(echo "${ARCH_EFI}" | sed "s#$(echo ${ARCH} | sed 's#\/#\\\/#')##")
arch-chroot $ARCH bash -c "/root/init.sh ${EFI}"
rm ${ARCH}/root/init.sh
umount -R ${ARCH}
