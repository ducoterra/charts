include .gitlab/Makefile

.PHONY: chart-setup
chart-setup:
	git remote add minecraft git@gitlab.ducoterra.net:services/minecraft_vanilla.git

.PHONY: pull-minecraft
pull-minecraft:
	git subtree pull --prefix minecraft minecraft master
