#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Yikes! That didn't seem to work. To try again, restart the installer as the root user."
  exit
fi
whiptail --title "Dragon System" --msgbox "Welcome to the Dragon System installer! By pressing OK, you agree to the terms and conditions and begin the installation." 8 78

echo "Preparing your system..."
apt-get update -y
apt-get upgrade -y

echo "Installing system software..."
apt-get install -y gdm3 gnome-session gnome-icon-theme --no-install-recommends # GNOME
apt-get install -y xserver-xorg # X.Org Server
apt-get install -y flatpak gnome-software-plugin-flatpak && flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo # Flatpak
apt-get install -y network-manager network-manager-openvpn-gnome # Network manager for GNOME with OpenVPN support
apt-get install -y xdg-user-dirs # Application capable of setting up the default XDG home directories

echo "Installing system applications..."
# GNOME
apt-get install -y nautilus
# flatpak install flathub org.gnome.Nautilus # Nautilus
apt-get install -y gnome-control-center
apt-get install -y gnome-terminal
apt-get install -y gnome-software
apt-get install -y gnome-tweaks
apt-get install -y software-properties-gtk

# Installing additional applications...
flatpak install flathub org.gnome.FileRoller # File Roller
flatpak install flathub org.mozilla.firefox -y # Firefox
flatpak install flathub org.mozilla.Thunderbird -y # Thunderbird
flatpak install flathub org.gnome.gedit -y # Gedit
flatpak install flathub org.gnome.Calculator -y # Calculator
flatpak install flathub ca.desrt.dconf-editor -y # Dconf
flatpak install flathub org.videolan.VLC -y # VLC
flatpak install flathub org.gnome.eog -y # Eye of GNOME
flatpak install flathub org.gnome.Evince -y # Evince
flatpak install flathub org.libreoffice.LibreOffice -y # LibreOffice
flatpak install flathub com.github.tchx84.Flatseal -y # Flatseal
flatpak install flathub org.gnome.seahorse.Application # Seahorse

echo "Configuring installed software..."
sed -i 's/managed=false/managed=true/g' /etc/NetworkManager/NetworkManager.conf # Set NetworkManager to manage networks
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close' # Set button layout for windows
xdg-user-dirs-update # Sets up the default home directories for the user

echo "Initiating system reboot..."
sleep 3
reboot
