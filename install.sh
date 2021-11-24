#!/usr/bin/env bash

echo Set variables
export INITIAL_WD=${PWD}

echo Clone prweb.war
cp distr/archives/prweb.war application/

echo Initialize database
docker-compose up -d database

echo Run install script
cd ./distr/scripts

./install.sh \
--driverJAR ${INITIAL_WD}/application/postgresql-42.2.14.jar \
--driverClass org.postgresql.Driver \
--dbType postgres \
--dbURL jdbc:postgresql://localhost:5432/postgres \
--dbUser postgres \
--dbPassword postgres \
--adminPassword install \
--rulesSchema rules \
--dataSchema data 

echo Start containers
cd ${INITIAL_WD}
docker-compose stop
docker-compose up -d

echo FINALE
