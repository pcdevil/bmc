BMC_MAKE := $(firstword ${MAKEFILE_LIST})
BMC_DIR := $(dir $(realpath ${BMC_MAKE}))
TEMP_DIR := $(realpath ${BMC_DIR}/tmp)
TASKS_DIR := $(realpath ${BMC_DIR}/tasks)

TASK_BASENAMES := \
	install-bat \
	install-docker \
	install-fnm \
	install-fzf \
	install-git \
	install-less \
	install-oh-my-zsh \
	install-ripgrep \
	install-rust \
	install-spaceship-prompt

SYSTEM = $(shell uname -s)
SYSTEM_CODENAME = $(shell lsb_realease --codename --short 2>/dev/null || echo)

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
	install-brew \
	set-macos-settings
endif

TASKS_FILES := $(foreach task_basename,${TASK_BASENAMES},${TASKS_DIR}/${task_basename}.mk)

ADD_APT_REPOSITORY_COMMAND = $(shell which add-apt-repository)
APT_COMMAND = sudo $(shell which apt)
APT_KEY_COMMAND = $(shell which apt-key)
APT_INSTALL_COMMAND = $(APT_COMMAND) install
APT_UPDATE_COMMAND = $(APT_COMMAND) update
APT_KEY_ADD_COMMAND = $(APT_KEY_COMMAND) add
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
