FNM_INSTALLSCRIPT_URL = https://fnm.vercel.app/install

.PHONY: install-fnm
install-fnm: ## installs the fast node manager
install-fnm:
	$(CURL_COMMAND) ${FNM_INSTALLSCRIPT_URL} | $(BASH_COMMAND) -s -- \
		--install-dir ${TARGET_DIR}/fnm \
		--skip-shell
