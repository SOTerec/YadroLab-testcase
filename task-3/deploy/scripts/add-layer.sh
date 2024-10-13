#!/bin/bash
cd $HOME/images/poky/

mkdir meta-hello-layer/

cd meta-hello-layer/

mkdir conf/ recipes-example/

mkdir recipes-example/yadro-hello/

mkdir recipes-example/yadro-hello/yadro-hello/

cp $HOME/conf/layer.conf $HOME/images/poky/meta-hello-layer/conf/

cp $HOME/conf/local.conf $HOME/images/poky/test-builds/conf/

cp $HOME/conf/yadro-hello.bb $HOME/images/poky/meta-hello-layer/recipes-example/yadro-hello/

cp $HOME/src/yadro_hello.c $HOME/images/poky/meta-hello-layer/recipes-example/yadro-hello/yadro-hello/

cd $HOME/images/poky/

. ./oe-init-build-env test-builds

bitbake-layers create-layer ../meta-hello-layer

bitbake-layers add-layer ../meta-hello-layer

bitbake core-image-minimal

exec "$@"
