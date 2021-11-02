include .gitlab/Makefile

.PHONY: pull-minecraft
pull-minecraft:
	git subtree pull --prefix minecraft minecraft master
