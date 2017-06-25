# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Using standard ubuntu/trusty64 box hosted in Hashicorp Atlas
  # Setting a static IP to the vm using network bridge provided
  # virtual box. Each vm will have different static IPs.

  config.vm.define :Database do |db|
    db.vm.box = "ubuntu/trusty64"
    db.vm.network "private_network", ip: "192.168.42.5", virtualbox__intnet: true
    db.vm.hostname = "database"
    db.vm.provider "virtualbox" do |dbvb|
      dbvb.name = "Database"
      dbvb.memory = 1024
      dbvb.cpus = 1
      dbvb.customize ["modifyvm", :id, "--cpuexecutioncap", "25"]
    end
    db.vm.provision :salt do |salt|
      salt.masterless = true
      salt.install_type = "stable"
      salt.minion_config = "db-minion"
      salt.minion_id = "kevin"
      salt.run_highstate = true
    end
  end

  config.vm.define :Webapp do |web|
    web.vm.box = "ubuntu/trusty64"
    web.vm.network "private_network", ip: "192.168.42.6", virtualbox__intnet: true
    web.vm.network :forwarded_port, guest: 80, host: 8081
    web.vm.hostname = "webapp"
    web.vm.provider "virtualbox" do |webv|
      webv.name = "Webapp"
      webv.memory = 512
      webv.cpus = 1
      webv.customize ["modifyvm", :id, "--cpuexecutioncap", "25"]
    end
    web.vm.provision :salt do |salt|
      salt.masterless = true
      salt.install_type = "stable"
      salt.minion_config = "web-minion"
      salt.minion_id = "bob"
      salt.run_highstate = true
    end
  end

  config.vm.define :Monitoring do |mon|
    mon.vm.box = "ubuntu/trusty64"
    mon.vm.network "private_network", ip: "192.168.42.7", virtualbox__intnet: true
    mon.vm.network :forwarded_port, guest: 3000, host: 8082
    mon.vm.hostname = "monitor"
    mon.vm.provider "virtualbox" do |monv|
      monv.name = "Monitoring"
      monv.memory = 512
      monv.cpus = 1
      monv.customize ["modifyvm", :id, "--cpuexecutioncap", "25"]
    end
  end

end
