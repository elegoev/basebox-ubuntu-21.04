#!/bin/bash

application_file_path="/vagrant/installed-application.md"

# update ubuntu
# sudo apt -y update
# echo n | sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

# set ls directory color
sudo echo "export LS_COLORS+=':ow=0;33'" >> /home/vagrant/.bashrc

# disable unattended upgrade
sudo echo -e "APT::Periodic::Update-Package-Lists \"0\";\nAPT::Periodic::Unattended-Upgrade \"0\";\n" > /etc/apt/apt.conf.d/20auto-upgrades

# set timezone
sudo unlink /etc/localtime
sudo ln -s /usr/share/zoneinfo/Europe/Zurich /etc/localtime
timedatectl

# set version
UBUNTU_VERSION=$(lsb_release -a | grep Release | awk  '{print $2}')
echo "# Installed application "  > $application_file_path
echo "***                     " >> $application_file_path
echo "> Ubuntu $UBUNTU_VERSION" >> $application_file_path

