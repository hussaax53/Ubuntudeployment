#! /bin/bash
  # Install terraform
apt-get update -y 
apt-get install unzip
wget https://releases.hashicorp.com/terraform/0.12.18/terraform_0.12.18_linux_amd64.zip
unzip terraform_0.12.18_linux_amd64.zip
mv terraform /usr/local/bin/

# Install ansible
apt update -y
apt install -y software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt install -y ansible

# Install Docker
apt remove --yes docker docker-engine docker.io \
    && apt update \
    && apt --yes --no-install-recommends install \
        apt-transport-https \
        ca-certificates \
    && wget --quiet --output-document=- https://download.docker.com/linux/ubuntu/gpg \
        | sudo apt-key add - \
    && add-apt-repository \
        "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu \
        $(lsb_release --codename --short) \
        stable" \
    && apt update \
    && apt --yes --no-install-recommends install docker-ce \
    && usermod --append --groups docker "$USER" \
    && systemctl enable docker \
    && printf '\nDocker installed successfully\n\n'

printf 'Waiting for Docker to start..\n\n'
sleep 3