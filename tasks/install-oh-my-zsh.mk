OH_MY_ZSH_GIT_URL = https://github.com/ohmyzsh/ohmyzsh

.PHONY: install-oh-my-zsh
install-oh-my-zsh: ## installs the oh-my-zsh framework
install-oh-my-zsh: .git
install-oh-my-zsh:
	$(GIT_CLONE_COMMAND) ${OH_MY_ZSH_GIT_URL} ${TARGET_DIR}/oh-my-zsh
