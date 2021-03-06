#!/usr/bin/env bash

echo Clone prweb.war
cp distr/archives/prweb.war application/

echo Initialize database
docker-compose up -d database

echo Run install script
docker-compose up installer

echo Start containers
docker-compose stop
docker-compose up -d database application

echo FINALE
