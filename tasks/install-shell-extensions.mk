GIT = $(shell which git)
GIT_CLONE = $(GIT) \
	clone \
	--depth=1

OH_MY_ZSH_GIT_URL = https://github.com/ohmyzsh/ohmyzsh
SPACESHIP_PROMPT_GIT_URL = https://github.com/denysdovhan/spaceship-prompt.git

.PHONY: install-oh-my-zsh
install-oh-my-zsh: ## installs the oh-my-zsh framework
install-oh-my-zsh:
	$(GIT_CLONE) ${OH_MY_ZSH_GIT_URL} ${TARGET_DIR}/oh-my-zsh

.PHONY: install-spaceship-prompt
install-spaceship-prompt: ## installs the spaceship zsh prompt
install-spaceship-prompt:
	$(GIT_CLONE) ${SPACESHIP_PROMPT_GIT_URL} ${TARGET_DIR}/spaceship-prompt
