#!/bin/bash
sudo apt update && sudo apt upgrade

sudo apt install gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 python3-subunit zstd liblz4-tool file locales libacl1

sudo locale-gen en_US.UTF-8

git clone git://git.yoctoproject.org/poky -b kirkstone

cd poky

source oe-init-build-env

bitbake core-image-minimal

cd ../../poky/build/tmp/deploy/images/

runqemu qemux86-64 slirp nographic
