#!/bin/sh
sudo pacman -Syu
sudo pacman -S neofetch man vi neovim \
    wget curl openssh rust nodejs npm \
    xorg xorg-server xorg-xinit xorg-xrandr \
    libxinerama feh picom dmenu rofi \
    alacritty zsh python-pip xclip

pip install --user --upgrade pynvim
npm install -g neovim

# installing paru (like yay but in rust)
sudo pacman -S --needed base-devel
cd /tmp
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

paru -S polybar leftwm nerf-fonts-anonymous-pro

echo "setting x11 keymap to azerty"
localectl --no-convert set-x11-keymap fr azerty

echo "downloarding dotfiles"
cd $HOME
git clone https://github.com/GeoffroyBerry/dotfiles.git
mv dotfiles .dotfiles
cd .dotfiles
echo "execute create-links.sh to make the dotfiles"
#./create-links.sh
echo "then you can use startx"

