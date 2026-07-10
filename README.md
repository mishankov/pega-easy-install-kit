# Pega simple installation kit

Scripts and files one needs to quickly install Pega Platform for testing purposes

> **DISCLAIMER:** this installation method is not suitable for production. But you can refer to it while building your environment

The kit runs Apache Kafka 4.0.2 as a single-node KRaft cluster and configures Pega to use it as an external Stream service. This combination is experimental, uses replication factor 1, and is intended only for local development and demonstrations. It is not an officially certified production configuration for Pega Platform.

_Tested on:_ 

![Pega](https://img.shields.io/badge/pega-8.5.1%20|%208.6.1%20|%208.6.2-433254)

## Prerequisites

- Docker - https://docs.docker.com/engine/install/
- Docker Compose - https://docs.docker.com/compose/install/
- Pega Platform distribution - https://community.pega.com/digital-delivery

## Installation

1. Clone or download this repository
2. Unpack Pega Platform distribution to `distr/` folder inside this repo
3. Copy `prweb.war` from `distr/archives` to `application/`

```shell
cp distr/archives/prweb.war application/
```

4. From the root directory of this repo run 

```shell
docker-compose up -d database
```

5. Run installer script

```shell
docker-compose up installer
```

6. Wait until installation finishes. You will see something like this

```shell
BUILD SUCCESSFUL
Total time: 69 minutes 42 seconds
```

7. After successful installation from the root directory of this repo run

```shell
docker-compose stop
docker-compose up -d database application web-tail kafka-ui
docker exec pega-logs node config-generator.js
```

Docker Compose starts Kafka automatically because the application service depends on a healthy Kafka broker. Pega and Kafbat UI connect from the Compose network at `kafka:9092`; the broker is not exposed directly to the host.

8. After some time go to http://localhost:8080/prweb, login with credentials administrator@pega.com / install and enjoy! 

Pega logs are available at http://localhost:4444/ powered by [web-tail](https://github.com/mishankov/web-tail)

Kafka topics, messages, and consumer groups are available in Kafbat UI at http://localhost:8081.

## Kafka checks

Check that the broker is healthy and list its topics:

```shell
docker compose exec kafka /opt/kafka/bin/kafka-topics.sh \
  --bootstrap-server localhost:9092 \
  --list
```

After Pega starts, describe the topics it created and verify that they use replication factor 1:

```shell
docker compose exec kafka /opt/kafka/bin/kafka-topics.sh \
  --bootstrap-server localhost:9092 \
  --describe
```

If Pega reports Kafka protocol compatibility errors, such as `UnsupportedVersionException`, replace `apache/kafka:4.0.2` with `apache/kafka:3.9.2`. Both versions use KRaft, so the rest of the Compose configuration can remain unchanged.
