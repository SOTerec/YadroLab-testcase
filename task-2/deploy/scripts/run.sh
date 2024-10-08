#!/bin/bash
cd images/poky

source oe-init-build-env

cd ~/images/poky/build/tmp/deploy/images/

runqemu qemux86-64 slirp nographic

exec "$@"
