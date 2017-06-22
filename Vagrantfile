# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Using standard ubuntu/trusty64 box hosted in Hashicorp Atlas
  # Setting a static IP to the vm using network bridge provided
  # virtual box. Each vm will have different static IPs.

  config.vm.define :Database do |db|
    db.vm.box = "ubuntu/trusty64"
    db.vm.network "private_network", ip: "192.168.42.5", virtualbox__intnet: true
    db.vm.provider "virtualbox" do |dbvb|
      dbvb.name = "Database"
      dbvb.memory = 512
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

end
