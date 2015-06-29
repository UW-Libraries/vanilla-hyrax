Create a symlink from playbook.yml.localhost or playbook.yml.vagrant to playbook.yml

eg. ln -s playbook.yml.vagrant playbook.yml

Create a symlink from either Vagrantfile.win or Vagrantfile.nix to Vagrantfile

eg. ln -s Vagrantfile.nix Vagrantfile

Copy and edit vars.yml.template  
Replace application_repo path

This currently fails if your git repo requires public/private keys bc I can't figure out the ssh forwarding (I think).

It also fails at Create secrets.yml file in druw role.  
msg: Destination directory does not exist
