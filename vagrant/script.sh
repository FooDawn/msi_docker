#!/bin/bash

echo "Updating and upgrading"
apt-get update > /dev/null
apt-get upgrade -y > /dev/null

echo "Installing docker so that gns3 will be able to run currectly"
apt-get remove -y docker docker-engine docker.io containerd runc > /dev/null
apt-get install -y apt-transport-https ca-certificates curl software-properties-common > /dev/null
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" > /dev/nul
apt-cache policy docker-ce > /dev/nul
apt-get install docker-ce -y > /dev/nul

# to check if it's running type: sudo systemctl status docker  docker run hello-world

# ADD NON-SUDO USER TO GNS3, UBRINGE
usermod -aG docker vagrant

echo "FINISHED"       
