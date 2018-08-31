#!/bin/bash

echo "Welcome to the DragonOS installer for Ubuntu-based distributions. The installer will automatically start in a moment."
echo "MAKE SURE YOU ARE USING THE NEWEST VERSION OF YOUR DISTRIBUTION!"
echo "PLEASE MAKE SURE YOU ARE USING A STABLE INTERNET CONNECTION, PREFERABLY WIRED!"
echo "IF YOU WANT TO CANCEL THE INSTALLATION, TERMINATE THIS PROCESS NOW!"
sleep 10
echo "The installer will now start installing Dragon OS."

echo "Preparing for installation..."
cd ..

echo "Preparing your system..."
sudo apt-get update
sudo apt-get upgrade

echo "Installing Budgie desktop environment..."
sudo apt-get install lightdm
sudo add-apt-repository ppa:ubuntubudgie/backports && sudo apt-get update
sudo apt-get install budgie-desktop
sudo add-apt-repository ppa:ricotz/docky && sudo apt-get update
sudo apt-get install plank
gsettings set net.launchpad.plank.dock.settings:/net/launchpad/plank/docks/dock1/ show-dock-item false
sudo add-apt-repository ppa:daniruiz/flat-remix && sudo apt-get update
sudo apt-get install flat-remix
gsettings set org.gnome.desktop.interface icon-theme 'Flat Remix'

echo "Installing Deepin desktop environment..."
cat <<EOF | sudo tee /etc/apt/sources.list.d/linuxdeepin.list
deb http://packages.linuxdeepin.com/ubuntu artfull main non-free universe
EOF
wget http://packages.linuxdeepin.com/deepin/project/deepin-keyring.gpg
gpg --import deepin-keyring.gpg
sudo gpg --export --armor 209088E7 | sudo apt-key add -
sudo apt-get update
sudo apt-get install dde-meta-core

echo "Installing dependencies..."
sudo apt-get install git
sudo apt-get install snapd
sudo apt-get install gdebi-core

echo "Installing core software..."
sudo apt-get install software-center

echo "Installing additional software..."
sudo snap install vlc
sudo snap install gimp
sudo snap install gnome-calculator
sudo snap install firefox
sudo snap install vlc
sudo snap install gedit
sudo snap install libreoffice
# --- WPS Office Installation ---
# wget -O wps-amd64.deb http://kdl1.cache.wps.com/ksodl/download/linux/a21//wps-office_10.1.0.5707~a21_amd64.deb
# sudo gdebi wps-amd64.deb
# rm wps-amd64.deb
# cd /tmp
# git clone https://github.com/iamdh4/ttf-wps-fonts.git
# cd ttf-wps-fonts
# sudo bash install.sh
# rm -rf /tmp/ttf-wps-fonts
# cd ..

echo "Completing installation..."
sudo apt-get update
sudo apt-get upgrade

echo "Installation complete!"
echo "In a moment, your computer will restart to finish the installation."
sleep 10
sudo reboot
