LESS_DIR = ${TARGET_DIR}/less
LESS_MAKEFILE = ${LESS_DIR}/Makefile
LESS_SOURCE_URL = http://www.greenwoodsoftware.com/less/less-${LESS_VERSION}.tar.gz
LESS_VERSION = 551
LESS_VERSIONED_DIR = ${TARGET_DIR}/less-${LESS_VERSION}

.PHONY: install-less
install-less: ## installs the less pager
install-less:
	$(CURL_COMMAND) ${LESS_SOURCE_URL} | $(TAR_EXTRACT_COMMAND) - --directory=${TARGET_DIR}
	mv ${LESS_VERSIONED_DIR} ${LESS_DIR}
	cd ${LESS_DIR} && ./configure
	$(MAKE) --directory=${LESS_DIR} --makefile=${LESS_MAKEFILE}
	sudo $(MAKE) --directory=${LESS_DIR} --makefile=${LESS_MAKEFILE} install
