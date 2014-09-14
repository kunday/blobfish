#! /bin/sh

set -e

getent group docker || groupadd docker
usermod -a -G docker vagrant

pacman -S --noconfirm docker

cat <<EOF > /usr/lib/systemd/system/docker-tcp.socket
[Unit]
Description=Docker Socket for the API

[Socket]
ListenStream=4243
Service=docker.service
BindIPv6Only=both

[Install]
WantedBy=sockets.target
EOF

cat <<EOF > /usr/lib/systemd/system/enable-docker-tcp.service
[Unit]
Description=Enable the Docker Socket for the API
After=docker.service

[Service]
Type=oneshot
ExecStart=/usr/bin/systemctl enable docker-tcp.socket
ExecStartPost=/usr/bin/systemctl stop docker.socket docker
ExecStartPost=/usr/bin/systemctl start docker-tcp.socket docker.socket
ExecStartPost=/usr/bin/systemctl start docker

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable docker-tcp.socket
sudo systemctl stop docker.socket docker
sudo systemctl start docker-tcp.socket docker.socket
sudo systemctl stop docker

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
