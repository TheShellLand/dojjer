#!/usr/bin/env bash

# docker entrypoint

set -e

# enter in shell commands here
nginx -g "daemon off;" &
while true; do
  certbot-auto renew
  sleep 86400
done

# execute additional arguments in bash
exec "$@"
