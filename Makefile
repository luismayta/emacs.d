.PHONY: build deploy lint test functions help
.DEFAULT_GOAL := help

# Configuration.
SHELL = /bin/bash
ROOT_DIR = $(shell pwd)
SCRIPT_DIR = $(ROOT_DIR)/script

# Bin scripts
CLEAN = $(shell) $(SCRIPT_DIR)/clean.sh
GRIP = $(shell) $(SCRIPT_DIR)/grip.sh
PYENV = $(shell) $(SCRIPT_DIR)/pyenv.sh
SETUP = $(shell) $(SCRIPT_DIR)/setup.sh
INSTALL = $(shell) $(SCRIPT_DIR)/install.sh
LINT = $(shell) $(SCRIPT_DIR)/lint.sh
TEST = $(shell) $(SCRIPT_DIR)/test.sh
FIX_GIT = $(shell) $(SCRIPT_DIR)/fix-git.sh
WATCH = $(shell) $(SCRIPT_DIR)/watch.sh

install: ## Make install packages
	$(INSTALL)

clean: ## Make clean files compilate
	$(CLEAN)

environment: ## Make create environment
	$(PYENV)
	$(INSTALL)

fix-git: ## Fix commit user
	$(FIX_GIT)

grip: ## Make grip documentation
	$(GRIP)

test: ## Make Test files
	$(TEST)

lint: ## Make Lint Files
	make clean
	$(LINT)

watch: ## Visualize files in realtime
	$(WATCH)

help: ## Show help text
	@echo "Commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "    \033[36m%-20s\033[0m %s\n", $$1, $$2}'