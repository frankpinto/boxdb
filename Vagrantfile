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
  config.vm.hostname = settings['hostname']

  config.vm.box_check_update = true

  #config.vm.network "forwarded_port", guest: 5432, host: 54320 # postgres
  config.vm.network "private_network", ip: settings['ip']

  # Re-map this folder to somewhere owned by 'vagrant', default /home/vagrant/boxdb
  # Also map whatever folder user wants, only salt is included by default
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

  # Configure The Public Key For SSH Access
  config.vm.provision "shell" do |s|
    s.inline = "echo $1 | tee -a /home/vagrant/.ssh/authorized_keys"
    s.args = [File.read(File.expand_path(settings["authorize"]))]
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    # Make my life easier on the terminal
    cd
    echo "alias l='ls -liah'" > .bash_aliases
    echo "set -o vi" >> .bashrc

    sudo su
    export DEBIAN_FRONTEND=noninteractive

    # Install generally useful tools
    apt-get update
    apt-get upgrade -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -y
    apt-get install -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -y vim git make sysstat htop

    # IMPORTANT: Set time
    ntpdate -s ntp.ubuntu.com pool.ntp.org time.nist.gov
    apt-get install -y ntp
    tee /etc/timezone <<< "America/Guatemala" > /dev/null
    dpkg-reconfigure --frontend noninteractive tzdata
    exit

    # Setup Vim
    mkdir -p .vim/bundle
    git clone https://github.com/gmarik/Vundle.vim.git
    wget -O .vimrc https://s3.amazonaws.com/ayalo.co/.vimrc
    # Have to run PluginInstall when you login
  SHELL

  # Use all the defaults:
  config.vm.provision :salt do |salt|

    salt.minion_config = "salt/minion"
    salt.run_highstate = true

  end
end
