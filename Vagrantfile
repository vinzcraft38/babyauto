# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.provision "shell", path: "scripts/bootstrap.sh"
  config.vm.network "public_network", bridge: "en0: Wi-Fi (Wireless)"
  (1..2).each do |i|
    config.vm.define "node-#{i}" do |node|
      node.vm.hostname = "node-#{i}"
      node.vm.network "public_network", ip: "192.168.0.10#{i}", hostname: true, bridge: "en0: Wi-Fi (Wireless)"
      node.vm.provision "shell", path: "scripts/node-provision.sh"
      node.vm.provider "virtualbox" do |vb|
        vb.name = "node-#{i}"
        vb.cpus = "2"
        vb.memory = "2048"
      end
    end
  end
end