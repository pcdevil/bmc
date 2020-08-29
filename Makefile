BMC_MAKE := $(firstword ${MAKEFILE_LIST})
BMC_DIR := $(dir $(realpath ${BMC_MAKE}))
TASKS_DIR := ${BMC_DIR}/tasks

default: help

include ${TASKS_DIR}/install-shell-extensions.mk

.PHONY: help
help:
	@fgrep -h "##" ${MAKEFILE_LIST} | fgrep -v fgrep | sed -e 's/\\$$//' -e 's/:.*#/: #/' | column -t -s '##'
