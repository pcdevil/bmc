DOCKER_PGP_KEY = https://download.docker.com/linux/debian/gpg
DOCKER_PPA_URL = https://download.docker.com/linux/debian
DOCKER_PPA_REPO = "deb [arch=amd64] ${DOCKER_PPA_URL} ${SYSTEM_CODENAME} stable"
DOCKER_APT_PACKAGES = \
	docker-ce \
	docker-ce-cli \
	containerd.io \
	docker-compose
DOCKER_INSTALLDMG_URL = https://download.docker.com/mac/stable/Docker.dmg

.PHONY: install-docker
install-docker: ## installs the docker containerisation solution

ifeq (${SYSTEM},Linux)
install-docker: .install-docker-linux
else ifeq (${SYSTEM},Darwin)
install-docker: .install-docker-macos
endif

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
