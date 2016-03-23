# Prerequisites:
 - Vagrant
 - Virtualbox

# Install centos 7 virtualbox image
`vagrant box add centos/7 https://atlas.hashicorp.com/centos/boxes/7`

# Check that it has installed
`vagrant box list`

and you should see 'centos/7' listed

# Clone this repo and the galaxy branch
`git clone git@bitbucket.org:younga3/vagrant-ansible-sufia.git`   
then cd into repo      
`git fetch && git checkout galaxy`

# Copy vars.yml.template to vars.yml
`cp vars.yml.template vars.yml`

# Start your vagrant box
`vagrant up --provider virtualbox`

# ssh into vagrant box
`vagrant ssh`

# cd into sync/ dir and run ansible playbook
`cd sync`   
`ansible-playbook -i inventory playbook.yml`

* You will probably have to start the last three commands manually 
 from the application_home dir, after ansible fails to run all the way through for now.   
`cd /home/vagrant/uwlib-druw`   
`solr_wrapper -d solr/config/ --collection_name hydra-development &`   
`fcrepo_wrapper -p 8984 &`   
`rails server -b 0.0.0.0`

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
