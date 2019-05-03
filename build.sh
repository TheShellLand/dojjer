#!/bin/bash

# dojjer build script

cd $(dirname $0)

if [ ! $(which docker) ]; then echo "Missing docker"; exit 1; fi
if [ ! -f Dockerfile ]; then echo "Missing Dockerfile"; exit 1; fi

STR=$(cat Dockerfile | grep LABEL | grep dockername) || { echo "failed"; exit 1; }
DOCKERNAME=$(echo "$STR" | cut -d '=' -f 2 | cut -d ' ' -f 3 | sed  's/"//g') || { echo "failed"; exit 1; }

# build image
docker build -t $DOCKERNAME .

# push image
docker push $DOCKERNAME

