#!/usr/bin/env bash

sudo yum -y update
sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum -y install ansible
#sudo yum -y install libffi-devel libssl-devel python-devel python-pip
#sudo pip install ansible

#ansible-galaxy install -p ~/sync/roles rvm_io.rmv1-ruby

#cd /home/vagrant/sync
#ansible-playbook -i inventory playbook.yml
