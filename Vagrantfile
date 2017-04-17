# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"

  config.vm.network "forwarded_port", guest:80, host: 4000
  config.vm.network "forwarded_port", guest:8080, host: 8081
  config.vm.network "forwarded_port", guest:3000, host: 3001
  config.vm.network "forwarded_port", guest:8983, host: 8985
  config.vm.network "forwarded_port", guest:8984, host: 8986

  config.vm.provider "virtualbox" do |v|
    #v.memory = "3072"
    v.memory = "2048"
  end

  config.vm.synced_folder "", "/vagrant"

  config.vm.provision :shell, :path => "install-ansible.sh"
end
