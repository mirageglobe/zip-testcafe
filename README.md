# testcafe with jessie

image for a single testcafe(https://github.com/DevExpress/testcafe) with jessie/stretch/alpine. this docker image is a builder for screen dependancies.

included packages :

- tini 0.18.0 (https://github.com/krallin/tini)
- node:10.15.0-jessie / stretch / alpine 3.9

# to use

for help

```
$ make
```

for building container

```
$ make build
```

for running container locally

```
$ make run-daemon
```
