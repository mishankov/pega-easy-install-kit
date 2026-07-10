echo Clone prweb.war
xcopy distr\archives\prweb.war application

echo Initialize database
compose up -d database

echo Run install script
compose up installer

echo Stop everything
compose stop

echo FINALE
