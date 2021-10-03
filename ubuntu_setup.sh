#!/bin/bash

#Add repo for flat-remix theme and run updates
sudo add-apt-repository ppa:daniruiz/flat-remix
sudo apt update && sudo apt full-upgrade

#Install packages I use and dependencies for virtualbox guest additions (First line is for virtualbox)
sudo apt install build-essential dkms linux-headers-$(uname -r) \
gnome-shell-extensions gnome-tweaks flat-remix-* numix-icon-theme-circle breeze-cursor-theme neofetch  \
vim curl wget git npm nodejs openjdk-11-* golang \
apt-transport-https ca-certificates curl gnupg lsb-release \
postgresql postgresql-contrib

#Install and configure Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io
sudo groupadd docker
sudo usermod -aG docker brigdon
sudo systemctl enable --now docker.service
sudo systemctl enable --now containerd.service

#Setup Postgres user and test database
sudo -u postgres createuser --interactive
sudo -u postgres createdb sammy

#Install snaps that I use
sudo snap install code --classic
sudo snap install goland --classic
sudo snap install datagrip --classic
sudo snap install pycharm-professional --classic
sudo snap install intellij-idea-ultimate --classic
sudo snap install android-studio --classic
sudo snap install insomnia
sudo snap install bitwarden

#Remove default home folders and create Git folder
rm -r ~/Music
rm -r ~/Public
rm -r ~/Templates
rm -r ~/Documents
rm -r ~/Pictures
rm -r ~/Videos
mkdir ~/Git

#Add neofetch to bashrc so I can fit in with the cool kids
echo neofetch >> ~/.bashrc
