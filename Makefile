#!/usr/bin/env make

.PHONY:

export AWS_PROFILE ?= ying.wang
export APP_VERSION ?= $(shell git rev-parse --short HEAD)
export GIT_REPO_ROOT ?= $(shell git rev-parse --show-toplevel)

export DOCKER_IMAGE_NAME ?= tinydevcrm-api-docs
export DOCKER_IMAGE_TAG ?= latest
export HUGO_PORT ?= 36948

# Start the development server.
#
# NOTE: Make sure to have your SSH credentials mounted in ~/.ssh.
check:
	@echo "Checking system dependencies..."
	@echo $$(make --version)
	@echo $$(docker --version)
	@echo $$(git --version)

version:
	@echo '{"Version": "$(APP_VERSION)"}'

setup:
	git submodule add --force https://github.com/bep/docuapi $(GIT_REPO_ROOT)/themes/docuapi
	hugo mod get -u

docker:
	docker build \
		--file $(GIT_REPO_ROOT)/Dockerfile \
		--tag $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG) \
		$(GIT_REPO_ROOT)

server:
	docker run \
		-v $(GIT_REPO_ROOT):/app \
		--net=host \
		$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG) \
		hugo server -p $(HUGO_PORT)
