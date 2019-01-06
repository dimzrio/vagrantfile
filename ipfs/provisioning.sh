#!/bin/bash
sudo yum -y install nano wget net-tools
sudo wget https://dist.ipfs.io/go-ipfs/v0.4.18/go-ipfs_v0.4.18_linux-amd64.tar.gz -P /root/
sudo tar -zxvf /root/go-ipfs_v0.4.18_linux-amd64.tar.gz -C /root/
sudo cp /root/go-ipfs/ipfs /bin/ipfs
sudo /bin/ipfs init
sudo cat << EOF > /usr/lib/systemd/system/ipfsd.service
[Unit]
Description=ipfs daemon

[Service]
ExecStart=/bin/ipfs daemon
Restart=always
User=root
Group=root

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable ipfsd
sudo systemctl restart ipfsd
