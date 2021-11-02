SHELL := /bin/bash

PROJECT_NAME ?= $(shell git config --local remote.origin.url | sed -n 's\#.*/\([^.]*\)\.git\#\1\#p')
VERSION ?= $(shell cat VERSION)
IMAGE ?= $(shell cat IMAGE):$(VERSION)
IMAGE_LATEST ?= $(shell cat IMAGE):latest
PWD ?= $(shell pwd)
STASH ?= "common-update-stash"

include .gitlab/make/docker.makefile
include .gitlab/make/helm.makefile
include .gitlab/make/kaniko.makefile
include .gitlab/make/truenas.makefile
include .gitlab/make/git.makefile

.PHONY: warning
warning:
	@printf "Running a potentially destructive command. If a conflict occurs, fix the conflict and re-run the command.\n"
	@printf "Cancel with ctrl + c within 3 seconds."
	@sleep 3

.PHONY: make-stash-drop
make-stash-drop:
	@if [ ! -z "$$(git stash list | grep -r 'stash@{0}.*common')" ]; then git stash drop; fi

.PHONY: make-update
make-update:
	@git subtree pull --prefix .gitlab --message "Merge update from Common" -q common main

.PHONY: make-push
make-push: warning
	@make make-update
	@git subtree split --branch common/$(PROJECT_NAME) --prefix .gitlab
	@git push common common/$(PROJECT_NAME):common/$(PROJECT_NAME)
