#!/usr/bin/env make

.PHONY: version check setup run start

export AWS_PROFILE ?= tinydevcrm-user
export APP_VERSION ?= $(shell git rev-parse --short HEAD)
export GIT_REPO_ROOT ?= $(shell git rev-parse --show-toplevel)

export DOCKER_IMAGE_NAME ?= tinydevcrm-api-docs
export HUGO_PORT ?= 36948

version:
	@echo '{"Version": "$(APP_VERSION)"}'

# Start the development server.
#
# NOTE: Make sure to have your SSH credentials mounted in ~/.ssh.
check:
	@echo "Checking system dependencies..."
	# GNU Make 4.2.1
	# Built for x86_64-pc-linux-gnu
	# Copyright (C) 1988-2016 Free Software Foundation, Inc.
	# License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
	# This is free software: you are free to change and redistribute it.
	# There is NO WARRANTY, to the extent permitted by law.
	@echo $$(make --version)
	# Docker version 19.03.8, build afacb8b7f0
	@echo $$(docker --version)
	# git version 2.27.0
	@echo $$(git --version)
	# aws-cli/1.18.35 Python/3.7.7 Linux/5.4.0-33-generic botocore/1.15.35
	@echo $$(aws --version)

setup:
	docker build \
		--file $(GIT_REPO_ROOT)/Dockerfile \
		--tag $(DOCKER_IMAGE_NAME):$(APP_VERSION) \
		$(GIT_REPO_ROOT)
	docker run \
		-v $(GIT_REPO_ROOT):/app \
		--net=host \
		$(DOCKER_IMAGE_NAME):$(APP_VERSION) \
		git clone https://github.com/bep/docuapi /app/themes/docuapi || true
	docker run \
		-v $(GIT_REPO_ROOT):/app \
		--net=host \
		$(DOCKER_IMAGE_NAME):$(APP_VERSION) \
		hugo mod get -u

# From: https://stackoverflow.com/a/14061796
# If the first argument is "run"...
ifeq (run,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "run"
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):;@:)
endif

# Lifts command into `docker run` context.
run:
	docker run \
		-v $(GIT_REPO_ROOT):/app \
		-v ~/.aws:/root/.aws \
		--net=host \
		$(DOCKER_IMAGE_NAME):$(APP_VERSION) \
		$(RUN_ARGS)

start:
	$(MAKE) run "hugo server -p $(HUGO_PORT)"

export AWS_STACK_NAME ?= tinydevcrm-api-docs

create-infra:
	# Copy infra-aws/stack-params.example.json to infra-aws/stack-params.json
	# and replace parameters.
	#
	# Change AWS CloudFormation stack name and AWS IAM profile as need be.
	# Default is generated from `tinydevcrm-backend`.
	aws cloudformation create-stack \
		--stack-name $(AWS_STACK_NAME) \
		--template-body file://infra-aws/stack.yaml \
		--parameters file://infra-aws/stack-params.json \
		--capabilities CAPABILITY_NAMED_IAM \
		--profile tinydevcrm-user

deploy-infra:
	aws cloudformation deploy \
		--stack-name $(AWS_STACK_NAME) \
		--template-file $(GIT_REPO_ROOT)/infra-aws/stack.yaml \
		--capabilities CAPABILITY_NAMED_IAM \
		--profile tinydevcrm-user

terminate-infra:
	aws cloudformation delete-stack \
		--stack-name $(AWS_STACK_NAME) \
		--profile tinydevcrm-user

# Change $S3_BUCKET_URI as needed.
export S3_BUCKET_URI ?= docs.tinydevcrm.com
deploy-content:
	rm -rf ./public
	hugo --verbose
	aws s3 sync ./build s3://$(S3_BUCKET_URI) --profile tinydevcrm-user
