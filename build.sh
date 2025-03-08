#!/bin/bash

# Update release file
sed -i -e 's/ID=silverblue/ID=developer/g' /usr/lib/os-release

set -ouex pipefail

systemctl enable podman.socket

# Setup DevPod
dnf5 -y install libappindicator-gtk3
curl -L -o devpod "https://github.com/loft-sh/devpod/releases/latest/download/devpod-linux-amd64" && install -c -m 0755 devpod /usr/local/bin && rm -f devpod

# Install github-cli
dnf5 -y install gh
