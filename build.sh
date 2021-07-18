#!/bin/bash

# dojjer build script

set -xe
cd $(dirname $0)

DOCKERNAME=theshellland/dojjer
DOCKERTAG=bash

# build image
docker build -t $DOCKERNAME:$DOCKERTAG .

# list image
docker images $DOCKERNAME

# push image
docker push $DOCKERNAME:$DOCKERTAG
