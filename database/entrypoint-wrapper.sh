#!/usr/bin/env bash
mkdir /logs
touch /logs/postgresql.log
chmod -R 777 /logs
tail -f /logs/* &
/docker-entrypoint.sh "$@"
