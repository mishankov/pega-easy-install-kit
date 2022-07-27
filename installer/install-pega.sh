#!/usr/bin/env bash

echo Set variables
export INITIAL_WD=${PWD}


echo Run install script
cd ./distr/scripts

./install.sh \
--driverJAR ${INITIAL_WD}/postgresql-42.2.14.jar \
--driverClass org.postgresql.Driver \
--dbType postgres \
--dbURL jdbc:postgresql://database:5432/postgres \
--dbUser postgres \
--dbPassword postgres \
--adminPassword install \
--rulesSchema rules \
--dataSchema data 
