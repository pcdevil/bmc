BMC_MAKE := $(firstword ${MAKEFILE_LIST})
BMC_DIR := $(dir $(realpath ${BMC_MAKE}))
TASKS_DIR := $(realpath ${BMC_DIR}/tasks)
TASK_BASENAMES := \
	install-brew \
	install-git \
	install-shell-extensions
TASKS_FILES := $(foreach task_basename,${TASK_BASENAMES},${TASKS_DIR}/${task_basename}.mk)

APT_COMMAND = $(shell which apt)
APT_INSTALL_COMMAND = $(APT_COMMAND) install
APT_UPDATE_COMMAND = $(APT_COMMAND) update
BASH_COMMAND = $(shell which bash)
CURL_COMMAND = $(shell which curl) \
	--fail \
	--location \
	--show-error \
	--silent

default: help

include ${TASKS_FILES}

.PHONY: help
help:
	@fgrep -h "##" ${MAKEFILE_LIST} | fgrep -v fgrep | sed -e 's/\\$$//' -e 's/:.*#/: #/' | column -t -s '##'
