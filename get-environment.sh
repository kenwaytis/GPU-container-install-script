apt update
apt --fix-broken install
if apt-cache search --names-only '^nvidia-535-server$'; then
    apt install -y nvidia-535-server
else
    echo "Specific NVIDIA driver not found. Install a default one or handle this situation as you see fit."
fi
apt install curl
curl -fsSL https://get.docker.com -o get-docker.sh
sh groupadd docker
usermod -aG docker $USER
newgrp docker

distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
      && curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
      && curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | \
            sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
            sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

apt-get update

apt-get install -y nvidia-container-toolkit

nvidia-ctk runtime configure --runtime=docker

systemctl restart docker
