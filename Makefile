include .gitlab/Makefile

.PHONY: pull-minecraft
pull-minecraft:
	git subtree pull --squash --prefix minecraft git@gitlab.ducoterra.net:services/minecraft_vanilla.git master
