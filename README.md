# Prerequisites:
 - Vagrant
 - Virtualbox

# Install centos 7 virtualbox image
`vagrant box add centos/7 https://atlas.hashicorp.com/centos/boxes/7`

On Windows, you might be given a choice between libvirt or virtualbox. Choose *virtualbox*.

# Check that it has installed
`vagrant box list`

and you should see 'centos/7' listed

# Clone this repo, then change to repo's directory
`git@bitbucket.org:uwlib/vagrant-ansible-sufia.git`

`cd vagrant-ansible-sufia`

# Copy vars.yml.template to vars.ym

`cp vars.yml.template vars.yml`

# Windows users
Kate says to use cygwin and edit the following gem in Vagrant   
https://github.com/mitchellh/vagrant/issues/6702#issuecomment-166503021

The path for the gem file on Windows is likely:
```C:\HashiCorp\Vagrant\embedded\gems\gems\vagrant-1.8.1\plugins\synced_folders\rsync```
That will change/differ depending on your version of Vagrant.

# Start your vagrant box
`vagrant up --provider virtualbox`

# ssh into vagrant box
`vagrant ssh`

# cd into sync/ dir and run ansible playbook
`cd sync`   
`ansible-playbook -i inventory playbook.yml`

* You will probably have to start the following commands manually. You will probably also have to hit enter to return your prompt after each service starts up. 
 from the application_home dir, after ansible fails to run all the way through for now.   
`cd /home/vagrant/uwlib-druw`   
* Start development solr   
`bundle exec solr_wrapper -d solr/config/ --collection_name hydra-development &`   
* Start FCRepo - your fedora project instance   
`bundle exec fcrepo_wrapper -p 8984 &`   
* Background resque workers should have already been started by ansible.   
* Start development rails server (needs to start as sudo until I figure out perms)   
`sudo rails server -b 0.0.0.0`

# Check Sufia is Running
Open a browser and go to `localhost:3000`. The initial load will take a bit (you'll see activity in SSH window as the rails server processes the request).

# Create a User
Go to `http://localhost:3000/users/sign_up` and create a new user (you will be making this user an admin in the next step).

# Create admin user
Follow the instructions on the main hydra sufia github page under admin users.   
https://github.com/projecthydra/sufia/wiki/Sufia-Management-Guide

 - First create a user from your browser at localhost:3000
 - Open another terminal and vagrant ssh in: `vagrant ssh `
 - Go to your application_home: `cd [yourapplicationhome]`
 - Start a rails console: `RAILS_ENV=development bundle exec rails c`
 - Search or scroll down to "Adding an admin user" in that github page mentioned above.
 - Follow those directions.

=============
Archive
==========
Prerequisites:
  - Fork uwlib/druw
  - Add deploy key to your fork

Before vagrant up:  
  - Create a symlink from playbook.yml.localhost or playbook.yml.vagrant to playbook.yml
  - Create a symlink from Vagrantfile.win or Vagrantfile.nix to Vagrantfile

eg. ln -s playbook.yml.localhost playbook.yml  
and  
eg. ln -s Vagrantfile.win Vagrantfile

  - Copy and edit vars.yml.template  
    - cp vars.yml.template vars.yml
    - Replace application_repo path

ssh forwarding work around  
  - for the initial vagrant up, comment out the following from Vagrantfile:  
    - config.ssh.private_key_path #this assumes your ssh key is in ~/.ssh/id_rsa, edit if different
    - config.ssh.forward_agent
  - after this fails somewhere around cloning druw repo edit Vagrantfile again and uncomment the above.

It also fails at Create secrets.yml file correctly in the druw role, so you have to manually create them and add them to the file.
RAILS_ENV=production bundle exec rake secret >> config/secrets.yml
then edit 

rake jetty:clean  
rake sufia:jetty:config  
rake jetty:start  

sudo service redis start  

RAILS_ENV=development bundle exec rake db:migrate  

bundle exec resque-pool --daemon --environment development start  

RAILS_ENV=development rails server