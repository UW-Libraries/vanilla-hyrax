# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  #config.vm.box = "chef/centos-7.0"
  config.vm.box = "centos/7"

  config.vm.network "forwarded_port", guest:80, host: 8080
  config.vm.network "forwarded_port", guest:3000, host: 3000
  config.vm.network "forwarded_port", guest:8983, host: 8983

  #config.ssh.private_key_path = "~/.ssh/id_rsa"
  config.ssh.forward_agent = true

  config.vm.provider "virtualbox" do |v|
    v.memory = "2048"
    #v.memory = "3072"
  end

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.extra_vars = { ansible_ssh_user: 'vagrant',
                 ansible_connection: 'ssh',
                 ansible_ssh_args: '-o ForwardAgent=yes -o UserKnownHostsFile=/dev/null'}
    ansible.verbose = "vvv"
    ANSIBLE_KEEP_REMOTE_FILES=1
  end
end
