hostname blobfish

grep blobfish /etc/hosts || cat >> /etc/hosts <<EOF

127.0.0.1 blobfish
EOF
