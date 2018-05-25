#!/bin/bash

echo "Updating pre docker install"

sudo apt-get -y update

sudo apt-get -y install \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

sudo apt-get -y update

echo "Installing Docker"

sudo apt-get -y install docker-ce

echo "Starting Docker"

sudo systemctl start docker

sudo systemctl enable docker 

echo "Giving current User Docker permissions"

sudo usermod -aG docker $USER

echo "Installing Docker Compose"

sudo pip install docker-compose

docker-compose --version
