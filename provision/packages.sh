#!/bin/bash
echo "Installing curl"
apt-get install -qqy curl
echo "Installing extra packages."
apt-get install -qqy vim tmux fish make
echo "Installing Ruby"
apt-get install -qqy ruby
echo "Install man-db to enable apropos."
sudo apt-get install -y man-db
