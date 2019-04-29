# testcafe with debian-jessie/debian-stretch/alpine3.9

image of testcafe (https://github.com/DevExpress/testcafe) with slim versions of debian-jessie/debian-stretch/alpine. this docker image is a builder for screen dependancies.

- maintainer : jimmy mg lim (mirageglobe@gmail.com) / www.mirageglobe.com
- source : https://github.com/mirageglobe/zenifyrevealjs
- docker : https://hub.docker.com/r/mirageglobe/testcafe

image dependancies :

- testcafe:jessie - official node:10.15-jessie-slim
- testcafe:stretch - official node:10.15-stretch-slim
- testcafe:alpine - official node:10.15-alpine

included packages :

- tini 0.18.0 (https://github.com/krallin/tini)

## how to use

for help

```
$ make
```

for building

```
$ make build
```

for running container locally

```
$ make daemon-run
```
