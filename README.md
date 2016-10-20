# Vagrant-ansible-sufia

This repository should set up a development instance of Sufia v.7+ in a Vagrant virtualbox

## Prerequisites:
 - Vagrant
 - Virtualbox

## Install centos 7 virtualbox image
`vagrant box add centos/7 https://atlas.hashicorp.com/centos/boxes/7`

On Windows, you might be given a choice between libvirt or virtualbox. Choose *virtualbox*.

## Check that it has installed
`vagrant box list`

and you should see 'centos/7' listed

## Clone this repo, then change to repo's directory
`git clone git@bitbucket.org:uwlib/vagrant-ansible-sufia.git`

`cd vagrant-ansible-sufia`

## Copy vars.yml.template to vars.yml.

`cp vars.yml.template vars.yml`   
Edit application_home if you want it to install in someplace other than /home/vagrant/sufia

## Windows users
Kate says to use cygwin and edit the following gem in Vagrant   
https://github.com/mitchellh/vagrant/issues/6702#issuecomment-166503021

The path for the gem file on Windows is likely:
```C:\HashiCorp\Vagrant\embedded\gems\gems\vagrant-1.8.1\plugins\synced_folders\rsync```
That will change/differ depending on your version of Vagrant.

## Start your vagrant box
`vagrant up --provider virtualbox`

## ssh into vagrant box
`vagrant ssh`

## cd into /vagrant dir and run ansible playbook
`cd /vagrant`   
`ansible-playbook -i inventory playbook.yml`

* You will have to start the following commands manually. You will probably also have to hit enter to return your prompt after each service starts up.   
`cd /home/vagrant/sufia`   
* Start development solr   
`bundle exec solr_wrapper -d solr/config/ --collection_name hydra-development &`   
* Start FCRepo - your fedora project instance   
`bundle exec fcrepo_wrapper -p 8984 &`   
* Start development rails server (needs to start as sudo until I figure out perms)   
`sudo rails server -b 0.0.0.0`

## Check Sufia is Running
Open a browser and go to http://localhost:3000. The initial load will take a bit (you'll see activity in SSH window as the rails server processes the request).

## Create a User
Go to http://localhost:3000/users/sign_up and create a new user (you will be making this user an admin in the next step).

## Create admin user
Follow the instructions on the main hydra sufia github page under admin users.   
https://github.com/projecthydra/sufia/wiki/Sufia-Management-Guide

 - First create a user from your browser at localhost:3000
 - Open another terminal and vagrant ssh in: `vagrant ssh `
 - Go to your application_home: `cd [yourapplicationhome]`
 - Start a rails console: `RAILS_ENV=development bundle exec rails c`
 - Search or scroll down to "Adding an admin user" in that github page mentioned above.
 - Follow those directions.
