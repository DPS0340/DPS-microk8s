#!/bin/bash

# Enable debug output
PS4="\n\033[1;33m>>\033[0m "; set -x

LOCATION=$(realpath "$0")
DIR=$(dirname "$LOCATION")

git clone https://aur.archlinux.org/snapd.git

cd $DIR/snapd

# For prevent seccomp.h dependency missing on nix-env gcc
CC=/usr/bin/gcc makepkg -si
cd ..

rm -rf $DIR/snapd

sudo systemctl enable --now snapd
sudo systemctl enable --now snapd.socket

