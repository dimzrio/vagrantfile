#!/bin/bash
sudo yum -y install epel-release centos-release-ceph-nautilus centos-release-openstack-stein 
sudo yum -y install ceph-ansible
sudo cp /usr/share/ceph-ansible/group_vars/all.yml.sample /usr/share/ceph-ansible/group_vars/all.yml
sudo cat << EOF >> /usr/share/ceph-ansible/group_vars/all.yml
# Configuration
ceph_origin: repository
ceph_repository: community
ceph_repository_type: cdn
ceph_stable_release: nautilus
fetch_directory: ~/ceph-ansible-keys
public_network: 192.168.56.0/24
cluster_network: "{{ public_network | regex_replace(' ', '') }}"
EOF

sudo cp /usr/share/ceph-ansible/group_vars/osds.yml.sample /usr/share/ceph-ansible/group_vars/osds.yml
sudo cat << EOF >> /usr/share/ceph-ansible/group_vars/osds.yml
devices:
  - /dev/sdb
EOF

sudo cat << EOF > /etc/ansible/hosts

# specify Ceph admin user for SSH and Sudo
[all:vars]
ansible_ssh_user=vagrant
ansible_become=true
ansible_become_method=sudo
ansible_become_user=root

# set Monitor Daemon Node
[mons]
node1

# set Manager Daemon Node
[mgrs]
node1

# set OSD (Object Storage Daemon) Node
[osds]
node1
node2
node3

EOF