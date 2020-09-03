CARGO_COMMAND = $(shell which cargo)
CARGO_INSTALL_COMMAND = $(CARGO_COMMAND) install
RUSTUP_INSTALLSCRIPT_URL = https://sh.rustup.rs

.PHONY: install-rust
install-rust: ## installs the rust programming language
install-rust:
	$(CURL_COMMAND) ${RUSTUP_INSTALLSCRIPT_URL} | $(BASH_COMMAND)

.PHONY: .cargo
ifeq (${CARGO_COMMAND},)
.cargo: install-rust
else
.cargo:
endif
