#!/bin/bash

echo "Welcome to the DragonOS installer for Ubuntu-based distributions. The installer will automatically start in a moment."
echo "MAKE SURE YOU ARE USING THE NEWEST VERSION OF YOUR DISTRIBUTION!"
echo "PLEASE MAKE SURE YOU ARE USING A STABLE INTERNET CONNECTION, PREFERABLY WIRED!"
echo "IF YOU WANT TO CANCEL THE INSTALLATION, TERMINATE THIS PROCESS NOW!"
sleep 10
echo "The installer will now start installing DragonOS."

echo "Preparing for installation..."
cd

echo "Adding repositories to system..."
sudo add-apt-repository ppa:ricotz/docky
sudo add-apt-repository ppa:daniruiz/flat-remix
sudo add-apt-repository ppa:ubuntubudgie/backports
sudo apt-get update

echo "Installing dependencies..."
sudo apt-get install gnome-keyring
sudo apt-get install git
sudo apt-get install snapd
sudo apt-get install gdebi

echo "Installing software..."
<<<<<<< HEAD
sudo apt-get install bookworm
sudo apt-get install rythmbox
sudo apt-get install transmission-cli transmission-common transmission-daemon
sudo apt-get install vlc
sudo snap install mailspring
sudo snap install qalculate
sudo apt-get install pinta
=======
sudo apt-get install firefox
sudo snap install vlc
sudo snap install mailspring
sudo snap install qalculate
sudo snap install atom
sudo snap install discord
>>>>>>> 16fe66bc608fc15c9df912edd139bbea56efe70d
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
sudo gdebi wps-amd64.deb
rm wps-amd64.deb
cd /tmp
git clone https://github.com/iamdh4/ttf-wps-fonts.git
cd ttf-wps-fonts
sudo bash install.sh
rm -rf /tmp/ttf-wps-fonts
cd
wget -O franz-amd64.deb https://github.com/meetfranz/franz/releases/download/v5.0.0-beta.18/franz_5.0.0-beta.18_amd64.deb
sudo gdebi franz-amd64.deb
rm franz-amd64.deb

echo "Installing core desktop environment..."
sudo apt-get install budgie-desktop

echo "Installing desktop environment additions..."
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
sudo apt-get install flat-remix
gsettings set org.gnome.desktop.interface icon-theme "Flat-Remix"

echo "Cleaning up..."
# Not implemented yet. Please put the removal scripts for your specific Linux distrobution here.

echo "Completing installation..."
sudo apt-get update
sudo apt-get upgrade

echo "Installation complete!"
echo "In a moment, your computer will restart to finish the installation."
sleep 10
sudo reboot
