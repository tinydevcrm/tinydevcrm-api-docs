#!/usr/bin/env make

.PHONY:

export AWS_PROFILE ?= ying.wang
export APP_VERSION ?= $(shell git rev-parse --short HEAD)
export GIT_REPO_ROOT ?= $(shell git rev-parse --show-toplevel)

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

server:
	hugo server -p $(HUGO_PORT)
