BMC_MAKE := $(firstword ${MAKEFILE_LIST})
BMC_DIR := $(dir $(realpath ${BMC_MAKE}))
TASKS_DIR := ${BMC_DIR}/tasks

APT_COMMAND = $(shell which apt)
APT_INSTALL_COMMAND = $(APT_COMMAND) install
APT_UPDATE_COMMAND = $(APT_COMMAND) update
BREW_COMMAND = $(shell which brew)
BREW_INSTALL_COMMAND = $(BREW_COMMAND) install

default: help

include ${TASKS_DIR}/install-git.mk
include ${TASKS_DIR}/install-shell-extensions.mk

.PHONY: help
help:
	@fgrep -h "##" ${MAKEFILE_LIST} | fgrep -v fgrep | sed -e 's/\\$$//' -e 's/:.*#/: #/' | column -t -s '##'
