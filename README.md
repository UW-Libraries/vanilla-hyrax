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