#!/bin/bash

# update repositories
DEBIAN_FRONTEND=noninteractive apt-get -o DPkg::Lock::Timeout=-1 update

# add new group and user ubuntu
groupadd -g 1001 ubuntu
useradd ubuntu -m -g 1001 -u 1001

# add ubuntu user to sudo group
usermod -aG sudo ubuntu

# make ubuntu user not be prompted for password
echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/ubuntu

# create ssh folder for ubuntu user
mkdir /home/ubuntu/.ssh
touch /home/ubuntu/.ssh/authorized_keys

# Install nginx
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
DEBIAN_FRONTEND=noninteractive apt-get -o DPkg::Lock::Timeout=-1 install nginx -y -q
systemctl enable nginx 2>/dev/null
