#!/bin/sh
# Author : Tharindu Dulshan

echo "updating existing list of packages"
sudo apt update

echo "installing a few prerequisite packages which let apt use packages over HTTPS"
sudo apt install apt-transport-https ca-certificates curl software-properties-common

echo "adding the GPG key for the official Docker repository to your system"
sudo apt install curl
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "Adding the Docker repository to APT sources"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

echo "updating the package database with the Docker packages from the newly added repo"
sudo apt update

apt-cache policy docker-ce

echo "installing Docker"
sudo apt install docker-ce

echo "checking docker status"
sudo systemctl status docker

echo "adding your username to the docker group"
sudo usermod -aG docker ${USER}
su - ${USER}







