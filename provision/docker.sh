#! /bin/sh

set -e
export DEBIAN_FRONTEND=noninteractive

getent group docker || groupadd docker
usermod -a -G docker vagrant

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sh -c 'echo deb https://apt.dockerproject.org/repo ubuntu-precise main > /etc/apt/sources.list.d/docker.list'
apt-get -y -q update

apt-get -y -q --force-yes install docker-engine
apt-get -y -q --force-yes install btrfs-tools

service docker restart

cat <<EOF > /etc/logrotate.d/docker
/var/lib/docker/containers/*/*-json.log {
  rotate 2
  daily
  compress
  missingok
  notifempty
  copytruncate
}
EOF

echo "Installing curl"
sudo apt-get install -qqy curl

echo "Installing docker-compose..."
rm /usr/local/bin/docker-compose
curl -L https://github.com/docker/compose/releases/download/1.4.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
