#! /bin/sh

sed -i -e 's|http://archive.ubuntu.com/ubuntu |mirror://mirrors.ubuntu.com/mirrors.txt |g' /etc/apt/sources.list
export DEBIAN_FRONTEND=noninteractive 

apt-get -y -q --force-yes update
apt-get -y -q --force-yes upgrade
apt-get install -y -q --force-yes apt-transport-https
