.PHONY: install-ripgrep
install-ripgrep: ## installs the ripgrep search tool
install-ripgrep: .cargo
install-ripgrep:
	$(CARGO_INSTALL_COMMAND) ripgrep
