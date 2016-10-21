#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# Install command-line tools using Homebrew.
brew update
brew upgrade --all

# editor wide
brew install the_silver_searcher
brew install editorconfig
brew install aspell --with-lang-en

# for the GNU global tag system. Used by ggtags.
brew install global
# program used for plantuml
brew install graphviz

brew install markdown