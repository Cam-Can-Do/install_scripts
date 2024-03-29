#!/bin/bash

apt update
apt upgrade

# Setup i3 window manager with config
apt_pkgs=(i3-wm redshift thunar rofi jq python3-i3ipc xinput vim flameshot git)
sudo apt-get -y --ignore-missing install "${apt_pkgs[@]}"

# Install Brave Browser
sudo apt-get install curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt-get -y install brave-browser

# Install VSCodium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install codium

# Install Discord
wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
sudo apt install ./discord.deb

# Clone my dotfiles
git clone https://github.com/Cam-Can-Do/i3wm-config.git /home/$SUDO_USER/i3_config
git clone https://github.com/Cam-Can-Do/dotfiles.git /home/$SUDO_USER/misc_config
