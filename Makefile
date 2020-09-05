BMC_MAKE := $(firstword ${MAKEFILE_LIST})
BMC_DIR := $(dir $(realpath ${BMC_MAKE}))
TASKS_DIR := $(realpath ${BMC_DIR}/tasks)

TASK_BASENAMES := \
	install-bat \
	install-brew \
	install-fnm \
	install-fzf \
	install-git \
	install-less \
	install-oh-my-zsh \
	install-ripgrep \
	install-rust \
	install-spaceship-prompt

ifeq (${SYSTEM},Linux)
	TASK_BASENAMES += \
		install-linux-localisations
	ifneq (,$(findstring GNOME,${XDG_CURRENT_DESKTOP}))
	TASK_BASENAMES += \
		set-gnome-settings
	endif
endif

ifeq (${SYSTEM},Darwin)
TASK_BASENAMES += \
	set-macos-settings
endif

TASKS_FILES := $(foreach task_basename,${TASK_BASENAMES},${TASKS_DIR}/${task_basename}.mk)

APT_COMMAND = sudo $(shell which apt)
APT_INSTALL_COMMAND = $(APT_COMMAND) install
APT_UPDATE_COMMAND = $(APT_COMMAND) update
BASH_COMMAND = $(shell which bash)
CURL_COMMAND = $(shell which curl) \
	--fail \
	--location \
	--show-error \
	--silent
TAR_EXTRACT_COMMAND = $(shell which tar) \
	--extract \
	--gzip \
	--file

default: help

include ${TASKS_FILES}

.PHONY: help
help:
	@fgrep -h "##" ${MAKEFILE_LIST} | fgrep -v fgrep | sed -e 's/\\$$//' -e 's/:.*#/: #/' | column -t -s '##'
