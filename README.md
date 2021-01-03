![build](https://travis-ci.org/luismayta/emacs.d.svg) ![code_climate](https://codeclimate.com/github/luismayta/emacs.d/badges/gpa.svg) ![tag](https://img.shields.io/github/tag/luismayta/emacs.d.svg?maxAge=2592000) ![test_coverage](https://codeclimate.com/github/luismayta/emacs.d/badges/coverage.svg) ![license](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square) ![say_thanks](https://img.shields.io/badge/SayThanks.io-%E2%98%BC-1EAEDB.svg?style=flat-square)

# My Emacs Configuration

Works only with Emacs 24 and later.

This is my configuration for Emacs. I like to keep my emacs nice and lightweight, so there's not much in here. Actually, it's more like Vim-flavoured Emacs, since it has Evil installed, the encoding of files is in utf-8.

## How to Use

### Dependences

This is a list of applications that need to be installed previously to enjoy all the goodies of this configuration.

- [Git](http://git-scm.com/)
- [editorconfig](http://editorconfig.org)
- [ctags](http://ctags.sourceforge.net)
- [graphviz](http://www.graphviz.or)
- [silver-searcher](https://github.com/ggreer/the_silver_searcher)

### Installation

Emacs is installed by running one of the following commands in your terminal. You can install this via the command-line with either `curl` or `wget`.

#### via curl

```{.sourceCode .bash}
sh -c "$(curl -fsSL https://rebrand.ly/github-6c1dc)"
```

- Only Creates the necessary files and folders.
- Blazing fast creation, forget about file creation and focus in actions.

### Requirements

- [python](https://www.python.org)
- [docker](https://www.docker.io)
- [docker compose](https://docs.docker.com/compose)

```{.sourceCode .bash}
$ make setup
```

### Test

```{.sourceCode .bash}
$ make setup
$ make docker.build env=test
$ make test.lint
```

### Credits

Made with :heart: :coffee:️ and :pizza: by [luismayta](https://github.com/luismayta).

- [All Contributors](docs/authors.md)
