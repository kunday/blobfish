#!/bin/bash
echo "Installing curl"
apt-get install -qqy curl

echo "Installing extra packages."
apt-get install -qqy vim tmux fish make

echo "Install man-db to enable apropos."
sudo apt-get install -y man-db

echo "Install dos2unix packages"
sudo apt-get install -y dos2unix
