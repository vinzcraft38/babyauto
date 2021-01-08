# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

IMAGE_NAME = "ubuntu/focal64"

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.provision "shell", path: "scripts/bootstrap.sh"
  config.vm.network "public_network", bridge: "en0: Wi-Fi (Wireless)"

  config.vm.provider "virtualbox" do |v|
      v.memory = 1800
      v.cpus = 2
  end
      
  config.vm.define "k8s-master" do |master|
      master.vm.box = IMAGE_NAME
      master.vm.network "public_network", ip: "192.168.0.200", hostname: true, bridge: "en0: Wi-Fi (Wireless)"
      master.vm.hostname = "k8s-master"
      master.vm.provision "ansible" do |ansible|
          ansible.playbook = "ansible/master-playbook.yml"
          ansible.extra_vars = {
              node_ip: "192.168.0.200",
          }
      end
  end

  (1..2).each do |i|
      config.vm.define "node-#{i}" do |node|
          node.vm.box = IMAGE_NAME
          node.vm.network "public_network", ip: "192.168.0.10#{i}", hostname: true, bridge: "en0: Wi-Fi (Wireless)"
          node.vm.hostname = "node-#{i}"
          node.vm.provision "ansible" do |ansible|
              ansible.playbook = "ansible/node-playbook.yml"
              ansible.extra_vars = {
                  node_ip: "192.168.0.10#{i}",
              }
          end
      end
  end 
end