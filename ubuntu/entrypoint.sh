#!/bin/sh

if [ ! -d "/tesstrain" ]; then
  ln -s /data_save /tesstrain
elif [ -z "$(ls -A /tesstrain)" ]; then
  cp -a /data_save/. /tesstrain/
fi
exec "$@"
