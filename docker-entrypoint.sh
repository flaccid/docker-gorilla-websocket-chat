#!/bin/sh -e

if [ "$WSS_ENABLED" = 'true' ]; then
  echo 'using wss enabled'
  sed -i 's%ws://%wss://%g' /home.html
fi

echo "> $@" && exec "$@"
