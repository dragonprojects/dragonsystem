#!/bin/bash

echo "Welcome to the Dragon OS installer for Ubuntu-based distributions. The installer will automatically start in a moment."
sleep 10
echo "YOU MUST KEEP THE FOLLOWING IN MIND:
echo "MAKE SURE YOU ARE USING THE NEWEST VERSION OF YOUR DISTRIBUTION!"
echo "PLEASE MAKE SURE YOU ARE USING A STABLE INTERNET CONNECTION, PREFERABLY WIRED!"
echo "NOBODY CAN BE HELD RESPONSIBLE FOR ANY DAMAGE TO YOUR SYSTEM!"
echo "AGREE/ACCEPT SOFTWARE INSTALLATIONS WHEN PROMPTED!"
echo "IF YOU WANT TO CANCEL THE INSTALLATION, TERMINATE THIS PROCESS NOW!"
sleep 10
echo "The installation of Dragon OS will now follow."
sleep 10

echo "Preparing for installation..."
cd ..

echo "Preparing your system..."
sudo apt-get update
sudo apt-get upgrade

# echo "Installing Budgie desktop environment..."
# sudo apt-get install lightdm
# sudo add-apt-repository ppa:ubuntubudgie/backports && sudo apt-get update
# sudo apt-get install budgie-desktop
# sudo add-apt-repository ppa:ricotz/docky && sudo apt-get update
# sudo apt-get install plank
# gsettings set net.launchpad.plank.dock.settings:/net/launchpad/plank/docks/dock1/ show-dock-item false
# sudo add-apt-repository ppa:daniruiz/flat-remix && sudo apt-get update
# sudo apt-get install flat-remix
# gsettings set org.gnome.desktop.interface icon-theme 'Flat Remix'

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
sudo apt-get install gnome-terminal
sudo apt-get install firefox
sudo apt-get install gedit
sudo apt-get install gnome-mpv

echo "Installing additional software..."
sudo snap install vlc
sudo snap install gimp
sudo snap install gnome-calculator

# --- Optional Lutris Installation ---
# ver=$(lsb_release -sr); if [ $ver != "18.04" -a $ver != "17.10" -a $ver != "17.04" -a $ver != "16.04" ]; then ver=18.04; fi
# echo "deb http://download.opensuse.org/repositories/home:/strycore/xUbuntu_$ver/ ./" | sudo tee /etc/apt/sources.list.d/lutris.list
# wget -q http://download.opensuse.org/repositories/home:/strycore/xUbuntu_$ver/Release.key -O- | sudo apt-key add -
# sudo apt-get update
# sudo apt-get install lutris

# --- Optional WPS Office Installation ---
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
