#!/bin/bash

# Install step CA
wget https://dl.step.sm/gh-release/cli/docs-cli-install/v0.18.0/step-cli_0.18.0_amd64.deb
sudo dpkg -i step-cli_0.18.0_amd64.deb
rm step-cli_0.18.0_amd64.deb

# Configure for local CA
step ca bootstrap --ca-url https://ca.local.hitoma.com --fingerprint bb35af6710bf5a4e8426d6c06e6084ca58197edc8c6ff39ed724da8c358de5af

# Install certs
step ca root > /tmp/root.crt
step certificate install --all /tmp/root.crt
rm /tmp/root.crt
