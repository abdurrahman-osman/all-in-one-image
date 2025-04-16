FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    curl \
    wget \
    telnet \
    netcat \
    iputils-ping \
    dnsutils \
    net-tools \
    gnupg \
    lsb-release \
    ca-certificates \
    git \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*

# kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \ 
           && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl \
           && rm kubectl
# Helm
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

CMD ["sleep", "infinity"]
