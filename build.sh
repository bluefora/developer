#!/bin/bash

# Update release file
sed -i -e 's/ID=workstation/ID=developer/g' /usr/lib/os-release
sed -i -e 's/(Workstation Edition)/(Developer Edition)/g' /usr/lib/os-release

set -ouex pipefail

# Update dconf
dconf update

systemctl enable podman.socket

# Setup DevPod
dnf5 -y install libappindicator-gtk3
curl -L -o devpod "https://github.com/loft-sh/devpod/releases/latest/download/devpod-linux-amd64" && install -c -m 0755 devpod /usr/local/bin && rm -f devpod

# Install github-cli
dnf5 -y install gh

# Install composer
dnf5 -y install composer
