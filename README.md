# Vanilla Hyrax

This repository should set up an instance of Hyrax in a Vagrant virtualbox based on centos 7. It will build either a development or a fullstack environment.

## Prerequisites:
 - Vagrant
 - Virtualbox

### Install centos 7 virtualbox image
`vagrant box add centos/7 https://atlas.hashicorp.com/centos/boxes/7`

On Windows, you might be given a choice between libvirt or virtualbox. Choose *virtualbox*.

### Check that it has installed
`vagrant box list`

and you should see 'centos/7' listed

### Clone this repo, then change to repo's directory
`git clone git@bitbucket.org:uwlib/vanilla-hyrax.git`

`cd vanilla-hyrax`

### Copy vars.yml.template to vars.yml.

`cp vars.yml.template vars.yml`

### Edit vars.yml as needed:

* Edit application_home if you want it to install in someplace other than /home/vagrant/hyrax, eg. /var/hyrax if building fullstack environment.

### Copy private.yml.template to private.yml.

`cp private.yml.template private.yml`

### Start your vagrant box
`vagrant up --provider virtualbox`

### ssh into vagrant box
`vagrant ssh`

---

## For development environment

### cd into /vagrant dir and run development playbook
`cd /vagrant`   
`ansible-playbook -i inventory development.yml`

* You will have to start the following commands manually. You will probably also have to hit enter to return your prompt after each service starts up.   
`cd /home/vagrant/hyrax`   
* Start development solr   
`bundle exec solr_wrapper -d solr/config/ --collection_name hydra-development &`   
* Start FCRepo - your fedora project instance   
`bundle exec fcrepo_wrapper -p 8984 &`   
* Start development rails server (needs to start as sudo until I figure out perms)   
`rails server -p 3000 -b 0.0.0.0`

### Check that Hyrax is Running
Open a browser and go to http://localhost:3001. The initial load will take a bit (you'll see activity in SSH window as the rails server processes the request).

### Create a User
Go to http://localhost:3001/users/sign_up and create a new user (you will be making this user an admin in the next step).

### Create admin user
Follow the instructions on the [Hyrax Management Guide](https://github.com/samvera/hyrax/wiki/Hyrax-Management-Guide) under 'Admin users'. https://github.com/samvera/hyrax/wiki/Making-Admin-Users-in-Hyrax

 - First create a user from your browser at localhost:3001
 - Open another terminal and vagrant ssh in: `vagrant ssh `
 - Go to your application_home: `cd [yourapplicationhome]`
 - Start a rails console: `RAILS_ENV=development bundle exec rails c`
 - Search or scroll down to "Add an initial admin user via command-line" in that github page mentioned above.
 - Follow those directions.

---

## For fullstack environment

### cd into /vagrant dir and run fullstack playbook   
`cd /vagrant`   
`ansible-playbook -i inventory fullstack.yml`

###Run the following commands.   

* `cd /var/hyrax`

* Create a default admin set. You only need to do this step ONCE when you first create your new VM:
    `sudo rails hyrax:default_admin_set:create RAILS_ENV=production`

* Generate a work type. You only need to do this step ONCE when you first create your new VM:
    `sudo rails generate hyrax:work Generic_Work RAILS_ENV=production`

* Restart apache
    `sudo systemctl restart httpd`