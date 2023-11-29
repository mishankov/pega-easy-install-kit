echo Clone prweb.war
xcopy distr\archives\prweb.war application

echo Initialize database
docker-compose up -d database

echo Run install script
docker-compose up installer

echo Stop everything
docker-compose stop

echo FINALE