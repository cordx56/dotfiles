#!/bin/bash -eu

sudo systemctl enable dhcpcd
sudo systemctl start dhcpcd

# Install yay
sudo pacman -Syu base-devel git go
git clone https://aur.archlinux.org/yay.git
cd ./yay
makepkg -si
cd ../
rm -rf ./yay

# Install GUI
if [[ ! -v NO_GUI ]]; then
	sudo pacman -S gnome dconf-editor gnome-tweaks gnome-usage gnome-weather
	yay -S gnome-terminal-transparency gnome-shell-extension-dash-to-dock
	# Install fonts
	yay -S otf-ipaexfont
	# Install IME
	yay -S fcitx-mozc-neologd-ut
	yay -S gnome-shell-extension-kimpanel-git
fi

# Install shell env
sudo pacman -S zsh zsh-completions zsh-theme-powerlevel9k
yay -S byobu
byobu-enable
chsh -s /bin/zsh

# Install L2TP/IPSec tools
yay -S networkmanager-l2tp

sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager


# Install tools
sudo pacman -S git gcc python3 python-pip go ghc stack php composer rust nodejs npm vim

## Setup Python
yay -S pyenv
pip install --user --upgrade pipenv

