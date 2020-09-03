.PHONY: install-bat
install-bat: ## installs the bat file displayer
install-bat: .cargo
install-bat:
	$(CARGO_INSTALL_COMMAND) bat
