#!/bin/bash

echo "Welcome to the DragonOS installer for Ubuntu-based distributions. The installer will automatically start in a moment."
echo "MAKE SURE YOU ARE USING THE NEWEST VERSION OF YOUR DISTRIBUTION!"
echo "PLEASE MAKE SURE YOU ARE USING A STABLE INTERNET CONNECTION, PREFERABLY WIRED!"
echo "IF YOU WANT TO CANCEL THE INSTALLATION, TERMINATE THIS PROCESS NOW!"
sleep 10
echo "The installer will now start installing Dragon OS."

echo "Preparing for installation..."
cd ..

echo "Adding repositories to system..."
sudo add-apt-repository ppa:ricotz/docky
sudo add-apt-repository ppa:daniruiz/flat-remix
sudo add-apt-repository ppa:ubuntubudgie/backports
sudo apt-get update

echo "Installing dependencies..."
sudo apt-get install git
sudo apt-get install snapd
sudo apt install gdebi-core
sudo apt-get install gnome-keyring
wget -O libpng-amd64.deb http://mirrors.edge.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb
sudo gdebi libpng-amd64.deb
rm libpng-amd64.deb

echo "Installing software..."
sudo snap install vlc
sudo snap install mailspring
sudo snap install qalculate
sudo snap install firefox
sudo snap install vlc
sudo snap install qalculate
sudo snap install atom
sudo snap install libreoffice
sudo snap install mailspring
# WPS Office - to be considered
# wget -O wps-amd64.deb http://kdl1.cache.wps.com/ksodl/download/linux/a21//wps-office_10.1.0.5707~a21_amd64.deb
# sudo gdebi wps-amd64.deb
# rm wps-amd64.deb
# cd /tmp
# git clone https://github.com/iamdh4/ttf-wps-fonts.git
# cd ttf-wps-fonts
# sudo bash install.sh
# rm -rf /tmp/ttf-wps-fonts
# cd ..

echo "Installing core desktop environment..."
sudo apt-get install budgie-desktop

echo "Installing desktop environment additions..."
sudo apt-get install plank
gsettings set net.launchpad.plank.dock.settings:/net/launchpad/plank/docks/dock1/ show-dock-item false
git clone https://github.com/KenHarkey/plank-themes.git
cd plank-themes
cp -r shade ~/.local/share/plank/themes/
cd ..
rm -rf plank-themes

echo "Completing installation..."
sudo apt-get update
sudo apt-get upgrade

echo "Installation complete!"
echo "In a moment, your computer will restart to finish the installation."
sleep 10
sudo reboot
