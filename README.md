局限性：

1. 仅限Ubutnu
2. 指定显卡驱动为 nvidia-535-server，如不存在则需要交互式手动指定

## 安装流程

- （可选）查看可安装的显卡驱动

```shell
ubuntu-drivers list
```

- 安装 Nvidia Driver

```shell
sudo apt update
sudo apt --fix-broken install
sudo apt install -y nvidia-535-server
```

- 安装 Docker

```shell
sudo apt install curl
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```

- 安装 Nvidia toolkit for docker

```shell
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
      && curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
      && curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | \
            sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
            sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
```
```shell
sudo apt-get update

sudo apt-get install -y nvidia-container-toolkit

sudo nvidia-ctk runtime configure --runtime=docker

sudo systemctl restart docker
```

## 便捷脚本


跟随上面的步骤，下面给出便捷脚本。


