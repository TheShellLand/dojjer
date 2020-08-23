#!/bin/bash

# dojjer build script

set -xe
cd $(dirname $0)

DOCKERNAME=theshellland/devops
DOCKERTAG=$(git describe --tag --always)

# build image
docker build -t $DOCKERNAME:$DOCKERTAG .

# list image
docker images $DOCKERNAME

# push image
docker push $DOCKERNAME:$DOCKERTAG

