SPACESHIP_PROMPT_GIT_URL = https://github.com/denysdovhan/spaceship-prompt.git

.PHONY: install-spaceship-prompt
install-spaceship-prompt: ## installs the spaceship zsh prompt
install-spaceship-prompt: .git
install-spaceship-prompt:
	$(GIT_CLONE_COMMAND) ${SPACESHIP_PROMPT_GIT_URL} ${TARGET_DIR}/spaceship-prompt
