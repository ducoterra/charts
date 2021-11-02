SHELL := /bin/bash

include .gitlab/Makefile

.PHONY: get-server
get-server:
	@mkdir -p world
	@echo 'eula=true' > world/eula.txt
	@docker run -it -e SERVER_VERSION=1.17.1 -v $(PWD)/world:/downloads ducoterra/get-minecraft:latest

.PHONY: run
run:
	docker-compose run --service-ports minecraft
