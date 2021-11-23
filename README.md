# Pega simple installation kit

> **DISCLAIMER:** this installation method is not suitable for production. But you can refer to it while building your environment

## Prerequisites
- Docker
- Docker Compose
- JDK + properly set `JAVA_HOME` environment variable
- Unpacked Pega Platform distribution

## Installation

1. Clone or download this repository
2. Unpack Pega Platform distribution to `distr/` folder inside this repo
3. From the root directory of this repo run 

```shell
docker-compose up -d database
```

4. Go to `distr/scripts` and run 

```shell
./install.sh \
--driverJAR /path/to/pega-easy-install-kit/libs/postgresql-42.2.14.jar \
--driverClass org.postgresql.Driver \
--dbType postgres \
--dbURL jdbc:postgresql://localhost:5432/postgres \
--dbUser postgres \
--dbPassword postgres \
--adminPassword install \
--rulesSchema rules \
--dataSchema data 

```
Change `/path/to` part in `--driverJAR` option to actual absolute path of `pega-easy-install-kit` folder

5. Wait until installation finishes. You will see something like this

```shell
BUILD SUCCESSFUL
Total time: 69 minutes 42 seconds
```

6. After successful installation from the root directory of this repo run

```shell
docker-compose stop
docker-compose up -d
```

7. After some time go to http://localhost:8080/prweb, login with credentials administrator@pega.com / install and enjoy! 
