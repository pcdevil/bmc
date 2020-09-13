GIT_COMMAND = $(shell which git)
GIT_CLONE_COMMAND = $(GIT_COMMAND) clone \
	--depth=1
GIT_PPA_REPO = ppa:git-core/ppa

.PHONY: install-git
install-git: ## installs the git version manager

ifeq (${SYSTEM},Linux)
install-git: .install-git-linux
else ifeq (${SYSTEM},Darwin)
install-git: .install-git-macos
endif

.PHONY: .git
ifeq (${GIT_COMMAND},)
.git: install-git
else
.git:
endif

.PHONY: .install-git-linux
.install-git-linux:
	$(ADD_APT_REPOSITORY_COMMAND) ${GIT_PPA_REPO}
	$(APT_UPDATE_COMMAND)
	$(APT_INSTALL_COMMAND) git

.PHONY: .install-git-macos
.install-git-macos: .brew
.install-git-macos:
	$(BREW_INSTALL_COMMAND) git
