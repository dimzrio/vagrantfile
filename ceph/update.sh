#!/bin/bash
sudo yum -y install epel-release
sudo yum -y groupinstall "Development Tools"
sudo cat << EOF > /home/vagrant/.ssh/config
Host node1
    Hostname node1.dimzrio.com
    User vagrant
Host node2
    Hostname node2.dimzrio.com
    User vagrant
Host node3
    Hostname node3.dimzrio.com
    User vagrant
EOF

sudo cat << EOF >> /etc/hosts
192.168.56.101 node1.dimzrio.com node1
192.168.56.102 node2.dimzrio.com node2
192.168.56.103 node3.dimzrio.com node3
EOF