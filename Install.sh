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

echo "Installing Debian packages..."
apt-get install -y flatpak

echo "Removing unneeded packages..."
apt autoremove --purge -y snapd

echo "Setting up Flatpak repositories.."
flatpak remote-add --if-not-exists fedora oci+https://registry.fedoraproject.org # Fedora
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo #Flathub
flatpak remote-add --if-not-exists winepak https://dl.winepak.org/repo/winepak.flatpakrepo # Winepak
