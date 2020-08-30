BREW_COMMAND = $(shell which brew)
BREW_INSTALL_COMMAND = $(BREW) install
BREW_INSTALLSCRIPT_URL = https://raw.githubusercontent.com/Homebrew/install/master/install.sh

.PHONY: install-brew
install-brew: ## installs the brew package manager
install-brew:
	$(CURL_COMMAND) ${BREW_INSTALLSCRIPT_URL} | $(BASH_COMMAND)

.PHONY: .brew
ifeq (${BREW_COMMAND},)
.brew: install-brew
else
.brew:
endif
