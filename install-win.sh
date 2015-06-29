#!/usr/bin/env bash

sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install ansible

mv /vagrant/inventory ~/vagrant/inventory

cd ~/vagrant
ln -s /vagrant/playbook.yml.localhost playbook.yml

