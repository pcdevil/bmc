fulllocalgen = $(firstword $(subst -, ,${1}))_$(lastword $(shell echo $(subst -, ,${1}) | tr '[:lower:]' '[:upper:]')).UTF-8
shortlocalgen = $(firstword $(subst -, ,${1}))

LOCALES = \
	fr \
	en-gb \
	hu
FULL_LOCALES = $(foreach locale,${LOCALES},$(call fulllocalgen,${locale}))
LOCAL_PACKAGES = $(foreach locale,${LOCALES},language-pack-$(call shortlocalgen,${locale}))
HUNSPELL_PACKAGES = $(foreach locale,${LOCALES},hunspell-${locale})

.PHONY: install-linux-localisations
install-linux-localisations: ## installs the language packs and dictionaries for linux
install-linux-localisations: .install-linux-localisation-packages
install-linux-localisations: .install-linux-localisation-generate

.PHONY: .install-linux-localisation-packages
.install-linux-localisation-packages:
	$(APT_INSTALL_COMMAND) ${LOCAL_PACKAGES} ${HUNSPELL_PACKAGES}

.PHONY: .install-linux-localisation-generate
.install-linux-localisation-generate:
	sudo locale-gen ${FULL_LOCALES}
