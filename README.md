# babyauto

# Verbinden zum Node-1 und diesen zum Master provisionieren
vagrant ssh node-1
sudo kubeadm init --apiserver-advertise-address 192.168.0.101
# kubectl für den aktuellen Benutzer konfigurieren
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
# -> kubeadm join Kommando kopieren (vom Ende der kubeadm-init-Ausgabe) (<STRG>+<Einfg>)
exit

# Verbinden zum Node-2 und diesen zum Cluster hinzufügen
vagrant ssh node-2
sudo # -> (<SHIFT>+<Einfg>)
exit

# zurück zum Master
vagrant ssh node-1
kubectl get nodes
# Pod-Netzwerk installieren
kubectl apply -f https://docs.projectcalico.org/v3.14/manifests/calico.yaml
kubectl get nodes
# bash-Autovervollständigung
echo 'source <(kubectl completion bash)' >>~/.bashrc
source .bashrc

# Anzeige der Pod - Node-Zuordnung
kubectl get pod --all-namespaces -o json | jq '.items[] | .spec.nodeName + " -> " + .metadata.name'