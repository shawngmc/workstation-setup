#!/bin/bash

# Install Key
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

# Install Repo
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# Install vault
sudo apt-get update && sudo apt-get install vault

# Set up token
lpass login shawngmc@gmail.com
vault login token=$(lpass show --password "Hitoma Vault Root Token")
