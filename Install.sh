#!/bin/bash

echo "Welcome to the Dragon OS installer for Ubuntu-based distributions. The installer will automatically start in a moment."
echo "MAKE SURE YOU ARE USING THE NEWEST VERSION OF YOUR DISTRIBUTION!"
echo "PLEASE MAKE SURE YOU ARE USING A STABLE INTERNET CONNECTION, PREFERABLY WIRED!"
echo "IF YOU WANT TO CANCEL THE INSTALLATION, TERMINATE THIS PROCESS NOW!"
sleep 10
echo "The installer will now start installing Dragon OS."

echo "Preparing for installation..."
cd
sudo apt-get update

echo "Adding repositories to system..."
sudo add-apt-repository ppa:transmissionbt/ppa
sudo add-apt-repository ppa:pinta-maintainers/pinta-stable
sudo add-apt-repository ppa:bookworm-team/bookworm
sudo add-apt-repository ppa:embrosyn/cinnamon
sudo add-apt-repository ppa:leaeasy/dde
sudo apt-get update

echo "Installing dependencies..."
sudo apt-get install gnome-keyring
sudo apt-get install git
sudo apt-get install snapd
sudo apt-get install gdebi-core
sudo apt-get install unzip

echo "Installing software..."
sudo apt-get install bookworm
sudo apt-get install rythmbox
sudo apt-get install transmission-cli transmission-common transmission-daemon
sudo apt-get install firefox
sudo apt-get install vlc
sudo snap install mailspring
sudo snap install qalculate
sudo apt-get install pinta
sudo apt-get install dde-calendar
sudo apt-get install deepin-system-monitor
sudo apt-get install deepin-screen-recorder
wget -O atom-amd64.deb https://atom.io/download/deb
sudo gdebi atom-amd64.deb
rm atom-amd64.deb
wget -O steam-amd64.deb http://media.steampowered.com/client/installer/steam.deb
sudo gdebi steam-amd64.deb
rm steam-amd64.deb
wget -O libpng-amd64.deb http://mirrors.edge.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb
sudo gdebi libpng-amd64.deb
rm libpng-amd64.deb
wget -O wps-amd64.deb http://kdl1.cache.wps.com/ksodl/download/linux/a21//wps-office_10.1.0.5707~a21_amd64.deb
sudo wps-amd64.deb
rm wps-amd64.deb
cd /tmp
git clone https://github.com/iamdh4/ttf-wps-fonts.git
cd ttf-wps-fonts
sudo bash install.sh
rm -rf /tmp/ttf-wps-fonts
cd

echo "Installing desktop environment..."
sudo apt install cinnamon
sudo apt-get install plank
gsettings set net.launchpad.plank.dock.settings:/net/launchpad/plank/docks/dock1/ show-dock-item false
git clone https://github.com/KenHarkey/plank-themes.git
cd plank-themes
cp -r shade ~/.local/share/plank/themes/
cd
rm -rf plank-themes
mkdir Roboto
cd Roboto
wget -O Roboto.zip https://github.com/google/roboto/releases/download/v2.138/roboto-android.zip
unzip Roboto.zip
rm Roboto.zip
cd
cp -r Roboto /usr/local/share/fonts

echo "Completing installation..."
sudo apt-get update
sudo apt-get upgrade
