#!/bin/bash

whiptail --msgbox "Welcome to the Dragon OS installer. To proceed, enter your user password after pressing OK." 10 50
echo "Please enter your password to proceed."
sudo -s
if [ "$EUID" -ne 0 ]
  then echo "Yikes! That didn't seem to work. To try again, restart the installer while make sure you are using an administrator account."
  exit
fi
whiptail --yesno "Would you like to begin the installation of Dragon OS? Please note that Dragon OS does not come with a warrenty of any kind. Cancelling the installation past this point may leave your system unusable." 10 50


echo "Preparing your system..."
apt-get update -y
apt-get upgrade -y

echo "Installing system software..."
apt-get install -y gdm3 gnome-session gnome-icon-theme --no-install-recommends # GNOME
apt-get install -y xserver-xorg # X.Org Server
apt-get install -y flatpak gnome-software-plugin-flatpak # Flatpak
apt-get install -y ffmpeg # ffmpeg, needed for Firefox

echo "Installing system applications..."
# GNOME
apt-get install -y nautilus
apt-get install -y gnome-control-center
apt-get install -y gnome-terminal
apt-get install -y gnome-software
# Other
apt-get install -y firefox # Firefox, needs ffmpeg
apt-get install -y software-properties-gtk

echo "Configuring installed software..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && flatpak remote-add --if-not-exists winepak https://dl.winepak.org/repo/winepak.flatpakrepo # Add Flathub and Winepak repo for Flatpak
sed -i -e 's/networkd/NetworkManager/g' /etc/netplan/01-netcfg.yaml # Set NetworkManager to manage networks

echo "Cleaning up unneeded files and software..."
apt autoremove --purge -y snapd
rm /usr/share/applications/software-properties-livepatch.desktop

echo "Initiating system reboot..."
sleep 3
reboot
