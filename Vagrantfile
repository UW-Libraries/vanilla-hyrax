# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"

  config.vm.network "forwarded_port", guest:80, host: 8080
  config.vm.network "forwarded_port", guest:3000, host: 3000
  config.vm.network "forwarded_port", guest:8983, host: 8983
  config.vm.network "forwarded_port", guest:8984, host: 8984

  config.vm.provider "virtualbox" do |v|
    #v.memory = "3072"
    v.memory = "2048"
  end

  config.vm.provision :shell, :path => "install-ansible.sh"
  
  #if which('ansible-playbook')
  #  config.vm.provision "ansible" do |ansible|
  #    ansible.playbook = "playbook.yml"
  #  end
  #else
  #  config.vm.provision "ansible_local" do |ansible|
  #    ansible.playbook = "playbook.yml"
  #    ansible.galaxy_role_file = "requirements.yml"
  #  end
  #end
end

# http://www.jeffgeerling.com/blog/use-vagrant-18s-new-ansiblelocal-provisioner