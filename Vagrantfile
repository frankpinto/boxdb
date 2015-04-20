# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'

env = ENV['ME'] || 'default'
dir = File.expand_path(File.dirname(__FILE__))
settings = YAML::load(File.read(dir + '/settings.yml'))[env]

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty32"
  config.vm.box_check_update = true

  #config.vm.network "forwarded_port", guest: 5432, host: 54320 # postgres
  config.vm.network "private_network", ip: settings['ip']

  # Re-map this folder to somewhere owned by 'vagrant', default /home/vagrant/boxdb
  config.vm.synced_folder '.', '/vagrant', disabled: true
  settings["folders"].each do |folder|
    config.vm.synced_folder folder["map"], folder["to"], type: folder["type"] ||= nil
  end

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", settings['memory']]
    vb.customize ["modifyvm", :id, "--cpus", settings['cpus']]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end
