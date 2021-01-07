#!/bin/sh

export DEBIAN_FRONTEND=noninteractive

# Konfiguration der Namensauflösung
#systemctl disable --now systemd-resolved
#rm /etc/resolv.conf
#echo "nameserver 192.168.100.2" > /etc/resolv.conf
#cp /vagrant/config/hosts /etc/hosts

# Docker-Installation
apt-get -y install docker.io
systemctl enable --now docker
sudo usermod -aG docker vagrant

# Kubernetes

#sudo apt-get update && sudo apt-get install -y apt-transport-https curl jq
#curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
#cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
#deb https://apt.kubernetes.io/ kubernetes-xenial main
#EOF
#sudo apt-get update
#sudo apt-get install -y kubelet kubeadm kubectl
#sudo apt-mark hold kubelet kubeadm kubectl



# Benutzer vagrant zu Gruppen hinzufügen
#adduser vagrant docker