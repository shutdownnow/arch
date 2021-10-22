#!/bin/sh
cp ./config/mirrorlist /etc/pacman.d/mirrorlist
echo "ParallelDownloads = 5" >> /etc/pacman.conf
timedatectl set-ntp true
pacstrap /mnt base base-devel linux linux-firmware dhcpcd iwd neovim sudo bash-completion git ntfs-3g adobe-source-han-serif-cn-fonts wqy-zenhei noto-fonts-cjk noto-fonts-emoji noto-fonts-extra
ln -sf /mnt/usr/share/zoneinfo/Asia/Shanghai /mnt/etc/localtime
ln -sf /mnt/usr/bin/nvim /mnt/usr/bin/vi
ln -sf /mnt/usr/bin/nvim /mnt/usr/bin/vim
cp ./config/grub /mnt/root/grub
echo 'ParallelDownloads = 5' >> /mnt/etc/pacman.conf
# 此行需开启32位库
echo -e '[archlinuxcn]\nServer = https://mirrors.ustc.edu.cn/archlinuxcn/$arch' >> /mnt/etc/pacman.conf
echo -e 'en_US.UTF-8 UTF-8\nzh_CN.UTF-8 UTF-8' >> /mnt/etc/locale.gen
echo 'LANG=en_US.UTF-8' >> /mnt/etc/locale.conf
echo 'Arch' >> /mnt/etc/hostname
echo -e '127.0.0.1\tlocalhost\n::1\tlocalhost\n127.0.1.1\tArch.localdomain\tArch' >> /mnt/etc/hosts
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt bash -c "pacman -Sy archlinuxcn-keyring --noconfirm;pacman -S nerd-fonts-fira-code --noconfirm;hwclock --systohc;locale-gen;pacman -S grub efibootmgr --noconfirm;mv /root/grub /etc/default/grub;grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=ArchLinux;grub-mkconfig -o /boot/grub/grub.cfg;systemctl enable dhcpcd iwd;useradd -m -G wheel -s /bin/bash nobume"
exit 0
