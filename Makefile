# Makefile for emacs.

# Configuration.
SHELL = /bin/bash
ROOT_DIR = $(shell pwd)
BIN_DIR = $(ROOT_DIR)/bin
DATA_DIR = $(ROOT_DIR)/var
SCRIPT_DIR = $(ROOT_DIR)/script

WGET = wget

# Bin scripts
CLEAN = $(shell) $(SCRIPT_DIR)/clean.sh
GRIP = $(shell) $(SCRIPT_DIR)/grip.sh
PYENV = $(shell) $(SCRIPT_DIR)/pyenv.sh
SETUP = $(shell) $(SCRIPT_DIR)/setup.sh
INSTALL = $(shell) $(SCRIPT_DIR)/install.sh
TEST = $(shell) $(SCRIPT_DIR)/test.sh
FIX_GIT = $(shell) $(SCRIPT_DIR)/fix-git.sh
WATCH = $(shell) $(SCRIPT_DIR)/watch.sh

install:
	$(INSTALL)


clean:
	$(CLEAN)


environment:
	$(PYENV)
	$(INSTALL)


maintainer-clean: distclean
	rm -rf $(BIN_DIR)
	rm -rf $(ROOT_DIR)/lib/


fix-git:
	$(FIX_GIT)


grip:
	$(GRIP)


test:
	$(TEST)


sync:
	$(SYNC)


watch:
	$(WATCH)
