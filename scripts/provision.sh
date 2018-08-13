#!/usr/bin/env bash

# make apt non-interactive and less verbose
export DEBIAN_FRONTEND=noninteractive
export APTARGS="-qq -o=Dpkg::Use-Pty=0"

# check if curl is installed
# check if nginx is installed
which curl nginx || {
  apt-get update ${APTARGS}
  apt-get install -y curl nginx ${APTARGS} 2>/dev/null
}

# stop nginx service
service nginx stop

# start nginx service
service nginx start
