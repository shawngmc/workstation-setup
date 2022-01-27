#!/bin/bash

# Cleanup old
sudo apt-get remove docker docker-engine docker.io containerd runc

# Prep tools
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
# Add gpg key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add repo
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

# Install new compose
wget -p /tmp/ https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64
chmod +x /tmp/docker-compose-linux-x86_64
sudo mkdir -pv /usr/local/lib/docker/cli-plugins
sudo mv /tmp/docker-compose-linux-x86_64 /usr/local/lib/docker/cli-plugins/docker-compose
