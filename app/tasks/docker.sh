#!/bin/bash
set -e

echo '---- install Docker'
echo 'deb https://apt.dockerproject.org/repo ubuntu-xenial main' | \
  tee -a /etc/apt/sources.list.d/docker.list

apt-key adv \
  --keyserver 'hkp://p80.pool.sks-keyservers.net:80' \
  --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

function apt-get() { while fuser -s /var/lib/dpkg/lock; do echo 'apt-get is waiting for the lock release ...'; sleep 1; done; /usr/bin/apt-get "$@"; }

DEBIAN_FRONTEND=noninteractive apt-get -y update
DEBIAN_FRONTEND=noninteractive apt-get -y install docker-engine

usermod --append --groups docker ubuntu
