#!/usr/bin/env bash

mv /vagrant/inventory ~/vagrant/inventory
cd ~/vagrant
ln -s /vagrant/playbook.yml.localhost playbook.yml

