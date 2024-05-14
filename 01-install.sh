#!/bin/bash

# Enable debug output
PS4="\n\033[1;33m>>\033[0m "; set -x

LOCATION=$(realpath "$0")
DIR=$(dirname "$LOCATION")

sudo snap install microk8s --classic

sudo usermod -a -G microk8s dps0340
sudo chown -R dps0340 ~/.kube

sudo newgrp microk8s
