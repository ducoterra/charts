SHELL := /bin/bash

IMAGE ?= $(shell cat IMAGE):$(shell cat VERSION)
IMAGE_LATEST ?= $(shell cat IMAGE):latest
PWD ?= $(shell pwd)

include .gitlab/make/docker.makefile
include .gitlab/make/helm.makefile
include .gitlab/make/kaniko.makefile
include .gitlab/make/truenas.makefile

.PHONY: make-update
make-update:
	@git stash
	-git subtree pull --prefix .gitlab git@gitlab.ducoterra.net:services/common.git main --squash
	@git stash pop
