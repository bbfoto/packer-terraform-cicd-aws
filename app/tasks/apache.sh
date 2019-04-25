#!/bin/bash
set -e

echo '---- install Apache'

function apt-get() { while fuser -s /var/lib/dpkg/lock; do echo 'apt-get is waiting for the lock release ...'; sleep 1; done; /usr/bin/apt-get "$@"; }

DEBIAN_FRONTEND=noninteractive apt-get -y update
DEBIAN_FRONTEND=noninteractive apt-get -y install apache2

cat > /var/www/html/index.html <<HERE
Plain text FTW!
HERE
