#Install Docker On Management Master and Worker Instance

wget https://releases.rancher.com/install-docker/20.10.sh && sh 20.10.sh && sudo apt  install docker.io || sudo systemctl start docker && sudo systemctl enable docker 
##sudo systemctl status docker

#Add Docker Group And user On Management Master and Worker Instance'

sudo addgroup wheel && sudo usermod -aG wheel ubuntu && sudo usermod -aG docker ubuntu && sudo chmod 777 /var/run/docker.sock
