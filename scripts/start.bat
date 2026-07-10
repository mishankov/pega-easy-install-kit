docker-compose up -d database application web-tail kafka-ui
docker exec pega-logs node config-generator.js
