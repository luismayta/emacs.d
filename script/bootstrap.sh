#!/usr/bin/env bash
# -*- coding: utf-8 -*-

PROJECT_NAME=emacs

PYTHON_VERSION=2.7.9
PYENV_NAME="${PROJECT_NAME}"

GVM_NAME="${PROJECT_NAME}"
GVM_PATHS_NAME=(
    "src"
    "pkg"
    "bin"
)

GRIP_PORT=6430

# Vars Dir
ROOT_DIR="$(pwd)"
RESOURCES_DIR="${SOURCE_DIR}/resources"
RESOURCES_DB_DIR="${RESOURCES_DIR}/db"
PROVISION_DIR="${ROOT_DIR}/provision/ansible"
SOURCE_DIR="${ROOT_DIR}"
REQUIREMENTS_DIR="${SOURCE_DIR}/requirements"
