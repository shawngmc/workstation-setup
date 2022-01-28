#!/bin/bash

wget -O /tmp/bitwarden-cli.zip "https://vault.bitwarden.com/download/?app=cli&platform=linux"
unzip -d /tmp/ /tmp/bitwarden-cli.zip
chmod +x /tmp/bw
sudo mv /tmp/bw /usr/bin
rm -rf /tmp/bitwarden-cli.zip

bw config server https://bitwarden.hitoma.com/
bw login shawngmc@gmail.com
