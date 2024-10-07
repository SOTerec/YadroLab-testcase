FROM ubuntu:20.04

RUN echo /usr/share/zoneinfo/Europe/Moscow > /etc/localtime 
RUN echo /usr/share/zoneinfo/Europe/Moscow > /etc/timezone

RUN apt update && apt upgrade 
RUN apt install -y sudo gawk wget git diffstat unzip texinfo gcc build-essential \
chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils \
iputils-ping python3-git python3-jinja2 python3-subunit zstd liblz4-tool file \
locales libacl1
RUN locale-gen en_US.UTF-8

RUN mkdir -p /home/user
RUN groupadd -g 1000 user 
RUN useradd -u 1000 -g user -d /home/user user
RUN usermod -aG sudo user
RUN chown -R user:user /home/user 
RUN echo "user:changeme" | chpasswd

ENTRYPOINT bash "$TARGET.sh" /bin/bash 

COPY scripts/build.sh scripts/run.sh /home/user/ 

ENV HOME=/home/user
WORKDIR $HOME

USER user
