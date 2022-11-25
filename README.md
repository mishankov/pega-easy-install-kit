# Pega simple installation kit

Scripts and files one needs to quickly install Pega Platform for testing purposes

> **DISCLAIMER:** this installation method is not suitable for production. But you can refer to it while building your environment

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
docker-compose up -d database application web-tail
docker exec pega-logs node config-generator.js
```

8. After some time go to http://localhost:8080/prweb, login with credentials administrator@pega.com / install and enjoy! 
