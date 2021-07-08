#!/bin/bash

# dojjer build script

set -xe
cd $(dirname $0)

DOCKERNAME=theshellland/dojjer:ldap
DOCKERTAG=$(git describe --tag --always)

# build image
docker build -t $DOCKERNAME .

# list image
docker images $DOCKERNAME

# push image
docker push $DOCKERNAME

