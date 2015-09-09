#!/bin/bash
echo "Installing Brightbox repo."

sudo apt-get install -y python-software-properties
sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update -qqy

echo "Installing ruby versions 1.8, 1.9.3 and 2.2"
sudo apt-get install -qqy ruby1.8 ruby1.9.3 ruby2.2
sudo apt-get install -qqy ruby2.2-dev
echo "Installing ruby-switch."
sudo apt-get install -qqy ruby-switch
sudo ruby-switch --set ruby2.2

echo "Update rubygems to latest."
sudo gem update --system

echo "Install bundler."
sudo gem install bundler
