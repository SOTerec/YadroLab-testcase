#!/bin/bash
cd images/poky

. ./oe-init-build-env test-builds

cd /home/user/images/poky/test-builds/tmp/deploy/images/

runqemu qemux86-64 slirp nographic

exec "$@"
