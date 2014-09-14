#! /bin/bash

sudo sed -i 's|GRUB_CMDLINE_LINUX_DEFAULT="quiet"|GRUB_CMDLINE_LINUX_DEFAULT="quiet net.ifnames=0" |g' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo pacman --noconfirm -Syy
sudo pacman --noconfirm -Su
