#!/usr/bin/env bash

sudo yum -y update
sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum -y install ansible
#ansible-galaxy install -p ~/sync/roles rvm_io.rmv1-ruby
cd ~/sync
#ansible-playbook -i inventory playbook.yml
#mv /vagrant/inventory ~/vagrant/inventory

#cd ~/vagrant
#ln -s /vagrant/playbook.yml.localhost playbook.yml

