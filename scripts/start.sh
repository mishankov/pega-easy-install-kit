#!/usr/bin/env bash

docker-compose up -d database application web-tail
docker exec pega-logs node config-generator.js
