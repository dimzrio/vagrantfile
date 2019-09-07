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