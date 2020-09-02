FZF_GIT_URL = https://github.com/junegunn/fzf.git

.PHONY: install-fzf
install-fzf: ## installs the fuzzy finder
install-fzf: .git
install-fzf:
	$(GIT_CLONE_COMMAND) ${FZF_GIT_URL} ${TARGET_DIR}/fzf
	${TARGET_DIR}/fzf/install --bin
