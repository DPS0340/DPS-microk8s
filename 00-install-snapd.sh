#!/bin/bash

# Enable debug output
PS4="\n\033[1;33m>>\033[0m "; set -x

LOCATION=$(realpath "$0")
DIR=$(dirname "$LOCATION")

git clone https://aur.archlinux.org/snapd.git

cd $DIR/snapd

# For prevent seccomp.h dependency missing on nix-env gcc
# Arch (pacman) only
# FIXME: Ports with multiple distros
CC=/usr/bin/gcc makepkg -si
cd ..

rm -rf $DIR/snapd

sudo ln -s /var/lib/snapd/snap /snap

sudo systemctl enable --now snapd
sudo systemctl enable --now snapd.socket
