#!/usr/bin/env bash

# entrypoint for ssh
# this is needed to start the ssh service

set -e

service ssh start
service ssh status

exec "$@"

