#!/bin/bash

# dojjer build script

set -xe
cd $(dirname $0)

DOCKERNAME=theshellland/dojjer:readyup
DOCKERTAG=$(git describe --tag --always)

# build image
docker build -t $DOCKERNAME:$DOCKERTAG .

# push image
docker push $DOCKERNAME:$DOCKERTAG

# list image
docker images $DOCKERNAME