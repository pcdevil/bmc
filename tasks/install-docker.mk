DOCKER_PGP_KEY = https://download.docker.com/linux/debian/gpg
DOCKER_PPA_URL = https://download.docker.com/linux/debian
DOCKER_PPA_REPO = "deb [arch=amd64] ${DOCKER_PPA_URL} ${SYSTEM_CODENAME} stable"
DOCKER_APT_PACKAGES = \
	docker-ce \
	docker-ce-cli \
	containerd.io \
	docker-compose
DOCKER_INSTALLDMG_URL = https://download.docker.com/mac/stable/Docker.dmg
DOCKER_CREDENTIAL_HELPERS_BINARY_FILE = docker-credential-${DOCKER_CREDENTIAL_HELPERS_STORE}
DOCKER_CREDENTIAL_HELPERS_VERSION = v0.6.3
DOCKER_CREDENTIAL_HELPERS_BINARY_URL = https://github.com/docker/docker-credential-helpers/releases/download/${DOCKER_CREDENTIAL_HELPERS_VERSION}/docker-credential-${DOCKER_CREDENTIAL_HELPERS_STORE}-${DOCKER_CREDENTIAL_HELPERS_VERSION}-amd64.tar.gz

.PHONY: install-docker
install-docker: ## installs the docker containerisation solution

ifeq (${SYSTEM},Linux)
install-docker: DOCKER_CREDENTIAL_HELPERS_STORE = secretservice
install-docker: .install-docker-linux
else ifeq (${SYSTEM},Darwin)
install-docker: DOCKER_CREDENTIAL_HELPERS_STORE = osxkeychain
install-docker: .install-docker-macos
endif

install-docker: .install-docker-credential-helpers

.PHONY: .install-docker-credential-helpers
.install-docker-credential-helpers:
	$(CURL_COMMAND) ${DOCKER_CREDENTIAL_HELPERS_BINARY_URL} | $(TAR_EXTRACT_COMMAND) - --directory=${TEMP_DIR}
	chmod +x ${TEMP_DIR}/${DOCKER_CREDENTIAL_HELPERS_BINARY_FILE}
	mv ${TEMP_DIR}/${DOCKER_CREDENTIAL_HELPERS_BINARY_FILE} ${TARGET_BIN_DIR}

.PHONY: .install-docker-linux
.install-docker-linux:
	$(APT_KEY_ADD_COMMAND) ${DOCKER_PGP_KEY}
	$(ADD_APT_REPOSITORY_COMMAND) ${DOCKER_PPA_REPO}
	$(APT_UPDATE_COMMAND)
	$(APT_INSTALL_COMMAND) ${DOCKER_APT_PACKAGES}

.PHONY: .install-docker-macos
.install-docker-macos:
	$(CURL_COMMAND) ${DOCKER_INSTALLDMG_URL} >${TEMP_DIR}/docker.dmg
	open ${TEMP_DIR}/docker.dmg
