#!/bin/sh

if [ ! -d "/var/volume" ]; then
  ln -s /data_save /var/volume
elif [ -z "$(ls -A /var/volume)" ]; then
  cp -a /data_save/. /var/volume/
fi
exec "$@"
