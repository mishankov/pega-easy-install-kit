# Pega simple installation kit

Scripts and files one needs to quickly install Pega Platform for testing purposes

> **DISCLAIMER:** this installation method is not suitable for production. But you can refer to it while building your environment

_Tested on:_ 

![Pega 8.5.1](https://img.shields.io/badge/pega-8.5.1-blue)
![Pega 8.5.1](https://img.shields.io/badge/pega-8.5.1-blue)

## Prerequisites
- Docker - https://docs.docker.com/engine/install/
- Docker Compose - https://docs.docker.com/compose/install/
- JDK + properly set `JAVA_HOME` environment variable - https://itsfoss.com/set-java-home-ubuntu/
- Pega Platform distribution - https://community.pega.com/digital-delivery

## Installation

1. Clone or download this repository
2. Unpack Pega Platform distribution to `distr/` folder inside this repo
3. Copy `prweb.war` from `distr/archives` to `application/`
4. From the root directory of this repo run 

```shell
docker-compose up -d database
```

5. Go to `distr/scripts` and run command below. Change `/path/to` part in `--driverJAR` option to the actual absolute path of `pega-easy-install-kit` folder (`~` is supported)

```shell
./install.sh \
--driverJAR /path/to/pega-easy-install-kit/application/postgresql-42.2.14.jar \
--driverClass org.postgresql.Driver \
--dbType postgres \
--dbURL jdbc:postgresql://localhost:5432/postgres \
--dbUser postgres \
--dbPassword postgres \
--adminPassword install \
--rulesSchema rules \
--dataSchema data 

```

6. Wait until installation finishes. You will see something like this

```shell
BUILD SUCCESSFUL
Total time: 69 minutes 42 seconds
```

7. After successful installation from the root directory of this repo run

```shell
docker-compose stop
docker-compose up -d
```

8. After some time go to http://localhost:8080/prweb, login with credentials administrator@pega.com / install and enjoy! 
