#!/usr/bin/env bash

echo Clone prweb.war
cp distr/archives/prweb.war application/

echo Initialize database
docker-compose up -d database web-tail
docker exec pega-logs node config-generator.js

echo Run install script
docker-compose up installer

echo Stop everything
docker-compose stop

echo FINALE
