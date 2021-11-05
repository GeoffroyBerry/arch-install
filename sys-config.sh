#!/bin/sh

ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime

loca=en_US
echo "Changing locale to $loca"
sed -iE "s/^#$loca\.UTF-8/$loca\.UTF-8/" /etc/locale.gen
sed -iE "s/^#$loca/$loca/" /etc/locale.gen

echo "generating locales ($loca)"
locale-gen

echo LANG="$loca.UTF-8" > /etc/locale.conf

echo "Changing keymap to fr (azerty)"
echo "KEYMAP=fr-latin1" > /etc/vconsole.conf

echo "HOSTNAME OF THE NEW MACHINE:"
read HOSTNAME
echo "$HOSTNAME" > /etc/hostname
echo "Changed hostname to $HOSTNAME"

echo "Enabling NetworkManager service"
systemctl enable NetworkManager

echo "Grub install..."
grub-install
echo "Making grub config..."
grub-mkconfig -o /boot/grub/grub.cfg

echo "CHANGING PASSWORD (probly root pasword):"
passwd

#echo "What username do you want (will be added to wheel group)?"
#read superuser
#echo "Creating user $superuser with groups $superuser and wheel"
#useradd -mU $superuser
#usermod -G wheel $superuser 
#echo "CHANGING $superuser PASSWORD"
#passwd $superuser
#echo "now manually edit sudoers : visudo /etc/sudoers"
#echo "done? You good to go!"
