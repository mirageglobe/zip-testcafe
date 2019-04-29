.DEFAULT_GOAL:=help
SHELL:=/bin/bash

DCR_URL=mirageglobe
DCR_IMG=testcafe
DCR_TAG=stretch

##@ Tools

.PHONY: build run stop
# phony is used to make sure theres no similar file such as <target> that cause the make recipie not to work

build:												## build image for testcafe
	@echo ":: building ${DCR_URL}-${DCR_IMG} ::"
	docker build -t ${DCR_URL}/${DCR_IMG}:${DCR_TAG} \
		--rm \
		-f ${DCR_TAG}/Dockerfile \
		--build-arg VCS_REF=`git rev-parse --short HEAD` \
    --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` .

run:													## run container : testcafe
	@echo ":: spinning up ${DCR_URL}-${DCR_IMG} container ::"
	docker run ${DCR_URL}/${DCR_IMG}:${DCR_TAG} testcafe

daemon-run:										## spinup daemon container : testcafe and keep running for tests
	@echo ":: spinning up ${DCR_URL}-${DCR_IMG} container ::"
	docker run -dt --name ${DCR_IMG} ${DCR_URL}/${DCR_IMG}:${DCR_TAG} sh

daemon-stop:									## stop daemon container : testcafe
	@echo ":: stopping ${DCR_URL}-${DCR_IMG} container ::"
	docker stop ${DCR_IMG} && docker rm ${DCR_IMG}

daemon-logs:									## show daemon container logs : testcafe
	@echo ":: show logs ${DCR_IMG} container ::"
	docker logs ${DCR_IMG}

##@ Helpers

.PHONY: help

help:  ## display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
	@printf "\n"
