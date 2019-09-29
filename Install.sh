#!/bin/bash

echo "Welcome to the Dragon OS installer for Ubuntu-based distributions. The installer will automatically start in a moment."
sleep 10
echo "YOU MUST KEEP THE FOLLOWING IN MIND:"
echo "MAKE SURE YOU ARE USING THE NEWEST VERSION OF YOUR DISTRIBUTION!"
echo "PLEASE MAKE SURE YOU ARE USING A STABLE INTERNET CONNECTION, PREFERABLY WIRED!"
echo "NOBODY CAN BE HELD RESPONSIBLE FOR ANY DAMAGE TO YOUR SYSTEM!"
echo "AGREE/ACCEPT SOFTWARE INSTALLATIONS WHEN PROMPTED!"
echo "IF YOU WANT TO CANCEL THE INSTALLATION, TERMINATE THIS PROCESS NOW!"
sleep 10
echo "The installation of Dragon OS will now follow."
sleep 10


echo "Preparing your system..."
apt-get update -y
apt-get upgrade -y
