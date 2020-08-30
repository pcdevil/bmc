CARGO_COMMAND = $(shell which cargo)
CARGO_INSTALL_COMMAND = $(CARGO_COMMAND) install
RUST_BINARIES = \
	bat \
	ripgrep
RUSTUP_INSTALLSCRIPT_URL = https://sh.rustup.rs

.PHONY: install-rust
install-rust: ## installs the rust programming language
install-rust:
	$(CURL_COMMAND) ${RUSTUP_INSTALLSCRIPT_URL} | $(BASH_COMMAND)

.PHONY: install-rust-binaries
install-rust-binaries: ## installs rust packages
install-rust-binaries: .cargo
install-rust-binaries:
	$(CARGO_INSTALL_COMMAND) ${RUST_BINARIES}

.PHONY: .cargo
ifeq (${CARGO_COMMAND},)
.cargo: install-rust
else
.cargo:
endif
