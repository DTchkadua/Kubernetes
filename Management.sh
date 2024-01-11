#Install Docker On Management Master and Worker Instance

wget https://releases.rancher.com/install-docker/20.10.sh && sh 20.10.sh && sudo apt  install docker.io || sudo systemctl start docker && sudo systemctl enable docker 
##sudo systemctl status docker

#Add Docker Group And user On Management Master and Worker Instance'

sudo addgroup wheel && sudo usermod -aG wheel ubuntu && sudo usermod -aG docker ubuntu && sudo chmod 777 /var/run/docker.sock

#Install Kubectl on Management

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" && echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check && sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && kubectl version --client

#Install Helm on Management, we need for install rancher API

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && chmod 700 get_helm.sh && ./get_helm.sh

#Install And Configure on Management

curl -s https://api.github.com/repos/rancher/rke/releases/latest | grep download_url | grep amd64 | cut -d '"' -f 4 | wget -qi - && chmod +x rke_linux-amd64 && sudo mv rke_linux-amd64 /usr/local/bin/rke && rke --version

# Configure cluster

# rke config --name cluster.yml
# export KUBECONFIG=/home/ubuntu/kube_config_cluster.yml
# echo $KUBECONFIG
