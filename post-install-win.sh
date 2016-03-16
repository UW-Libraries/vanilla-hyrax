#!/usr/bin/env bash

sudo yum -y install epel-release
sudo yum -y update
sudo yum -y install ansible

cd ~/vagrant/sync
ansible-galaxy install -p ~/vagrant/sync/roles rvm_io.rmv1-ruby
