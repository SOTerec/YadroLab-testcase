#!/bin/bash
chown -R 1000:1000 /home/user/images

cd images

git clone git://git.yoctoproject.org/poky -b kirkstone

cd poky

source oe-init-build-env

bitbake core-image-minimal

exec "$@"
