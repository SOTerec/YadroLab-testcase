#!/bin/bash
cd images

# git clone git://git.yoctoproject.org/poky -b kirkstone

cd poky

. ./oe-init-build-env test-builds

bitbake core-image-minimal

env

exec "$@"
