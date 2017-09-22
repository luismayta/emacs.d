.PHONY: build deploy lint test functions help
.DEFAULT_GOAL := help

DOCKER_NETWORK = emacs_network
PROYECT_NAME = emacs

# Configuration.
SHELL = /bin/bash
ROOT_DIR = $(shell pwd)
MESSAGE="༼ つ ◕_◕ ༽つ"
MESSAGE_HAPPY="${MESSAGE} Happy Coding"
SCRIPT_DIR = $(ROOT_DIR)/script

# Bin scripts
BUILD = $(shell) $(SCRIPT_DIR)/build.sh
CLEAN = $(shell) $(SCRIPT_DIR)/clean.sh
DOCUMENTATION = $(shell) $(SCRIPT_DIR)/documentation.sh
DOWN = $(shell) $(SCRIPT_DIR)/down.sh
PYENV = $(shell) $(SCRIPT_DIR)/pyenv.sh
INSTALL = $(shell) $(SCRIPT_DIR)/install.sh
LIST = $(shell) $(SCRIPT_DIR)/list.sh
LINT = $(shell) $(SCRIPT_DIR)/lint.sh
TEST = $(shell) $(SCRIPT_DIR)/test.sh
STOP =  $(shell) $(SCRIPT_DIR)/stop.sh
SETUP =  $(shell) $(SCRIPT_DIR)/setup.sh
UP = $(shell) $(SCRIPT_DIR)/up.sh

install: ## Make install packages
	$(INSTALL)

clean: ## Make clean files compilate
	$(CLEAN)

documentation: ## Make Documentation
	make clean
	$(DOCUMENTATION)

environment: ## Make create environment
	$(PYENV)
	$(INSTALL)

fix-git: ## Fix commit user
	$(FIX_GIT)

list: ## List of current active services by env
	make clean
	@echo $(MESSAGE) "List Services: ${env}"
	$(LIST) "${env}" && echo $(MESSAGE_HAPPY)

lint: ## Clean files unnecesary
	make clean
	$(LINT)

test: ## make test
	make clean
	$(TEST)

up: ## Up application by env
	make clean
	make verify_network &> /dev/null
	@echo $(MESSAGE) "Up Application environment: ${env}"
	$(UP) "${env}" && echo $(MESSAGE_HAPPY)

restart: ## Reload services
	@echo $(MESSAGE) "restart Application environment: ${env}"
	docker-compose restart

ssh: ## Connect to container
	docker exec -it $(CONTAINER) bash

stop: ## stop containers docker by env
	make clean
	@echo $(MESSAGE) "Stop Services: ${env}"
	$(STOP) "${env}" && echo $(MESSAGE_HAPPY)

setup: ## Install dependences initial
	make clean
	$(SETUP)

verify_network: ## Verify network
	@if [ -z $$(docker network ls | grep $(DOCKER_NETWORK) | awk '{print $$2}') ]; then\
		(docker network create $(DOCKER_NETWORK));\
	fi

help: ## Show help text
	@echo $(MESSAGE) "Commands"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "    \033[36m%-20s\033[0m %s\n", $$1, $$2}'
