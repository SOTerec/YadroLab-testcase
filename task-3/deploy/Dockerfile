FROM ubuntu:20.04

RUN echo /usr/share/zoneinfo/Europe/Moscow > /etc/localtime && \
    echo /usr/share/zoneinfo/Europe/Moscow > /etc/timezone

RUN apt update && apt upgrade; \ 
    apt install -y sudo \
    gawk \
    wget \
    git \
    diffstat \
    unzip \
    texinfo \
    gcc \
    build-essential \
    chrpath \
    socat \
    cpio \
    python3 \
    python3-pip \
    python3-pexpect \
    xz-utils \
    debianutils \
    iputils-ping \
    python3-git \
    python3-jinja2 \
    python3-subunit \
    zstd \
    liblz4-tool \
    file \
    locales \
    libacl1  

RUN locale-gen en_US.UTF-8

RUN mkdir /home/user && \
    mkdir /home/user/images && \
    mkdir /home/user/scripts/ && \
    mkdir /home/user/src/ && \
    mkdir /home/user/conf/ && \
    groupadd -g 1000 user && \
    useradd -u 1000 -g user -d /home/user -c /bin/bash user && \
    usermod -aG sudo user && \
    chown -R 1000:1000 /home/user && \
    echo "user:changeme" | chpasswd

ENTRYPOINT bash "scripts/$TARGET.sh" \
           /bin/bash 

COPY scripts/build.sh \
     scripts/run.sh \
     scripts/add-layer.sh \
     /home/user/scripts/ 

COPY conf/layer.conf \
     conf/local.conf \
     conf/yadro-hello.bb \
     /home/user/conf/
COPY src/yadro_hello.c \
     /home/user/src/

ENV HOME=/home/user
WORKDIR /home/user 

USER user 
