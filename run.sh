#!/bin/bash

if [ 0 -eq `grep -v "^#" /etc/apt-cacher-ng/security.conf | grep -E "[a-z]" | wc -l` ]; then
    RANDOM_PASS=`head /dev/urandom | base64 | head -c 16`
    APP_USER=${APP_USER:-root}
    APP_PASS=${APP_PASS:-$RANDOM_PASS}
    echo "AdminAuth: ${APP_USER}:${APP_PASS}" | tee -a /etc/apt-cacher-ng/security.conf
fi

/usr/sbin/apt-cacher-ng -c /etc/apt-cacher-ng pidfile=/var/run/apt-cacher-ng/pid SocketPath=/var/run/apt-cacher-ng/socket foreground=1 -v
