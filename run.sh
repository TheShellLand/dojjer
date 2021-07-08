#!/bin/bash

# dojjer build script

set -xe

DOCKERNAME=theshellland/dojjer:antsable
docker run --rm -it $DOCKERNAME
