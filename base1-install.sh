#!/bin/bash

# 执行脚本前需先手动操作:

# 1、连上网络
# 2、手动建立硬盘分区，并挂载在 /mnt 目录下

# 拷贝配置文件
mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.old
cp ./config/mirrorlist /etc/pacman.d/mirrorlist

# 更新系统时间
timedatectl set-ntp true

# 安装软件包
pacman -Sy
pacstrap /mnt base linux linux-firmware \
    base-devel dhcpcd man-db man-pages

# 配置 Fstab
genfstab -U /mnt >> /mnt/etc/fstab

exit 0
