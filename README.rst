|wercker| |build_status| |code_climate| |github_tag| |test_coverage| |license| |say_thanks|

:Version: 1.3.1
:Web: https://github.com/luismayta/emacs.d
:Download: http://github.com/luismayta/emacs.d
:Source: http://github.com/luismayta/emacs.d
:Keywords: emacs.d

.. contents:: Table of Contents:
    :local:

My Emacs Configuration
######################

Works only with Emacs 24 and later.

This is my configuration for Emacs. I like to keep my emacs nice and
lightweight, so there's not much in here. Actually, it's more like
Vim-flavoured Emacs, since it has Evil installed, the encoding of files
is in utf-8.

How to Use
**********

Dependences
===========

This is a list of applications that need to be installed previously to
enjoy all the goodies of this configuration.

-  `Git`_
-  `editorconfig`_
-  `ctags`_
-  `graphviz`_
-  `silver-searcher`_

Installation
============

Emacs is installed by running one of the following commands in your
terminal. You can install this via the command-line with either ``curl``
or ``wget``.

via curl
--------

.. code-block:: bash

    sh -c "$(curl -fsSL https://raw.github.com/luismayta/emacs.d/master/install.sh)"

via wget
--------

.. code-block:: bash

    sh -c "$(wget https://raw.github.com/luismayta/emacs.d/master/install.sh -O -)"

Provided you have Emacs 24 installed, when you run it the first time, it
will connect with the ELPA package repositories and install the custom
packages. You'll see some warnings being logged to a split window while
this happens. Just wait; it's nothing to worry about.

Once Emacs is finished installing packages, you can close the
``*Compile-Log*`` window with C-x 1. Don't forget you'll be in Evil
mode, so you should use vi key bindings. Get back to Emacs regular mode
with C-\\.


Help/Support
************

|Gitter|

Content
*******

Included packages
=================

I only add packages to my config file if I feel a significant benefit in
having them slowing down my startup time. Emacs 24 has a lot of nice
stuff built-in anyway.

-  Evil mode

   -  this might not be to everybody's liking
   -  C-\\ switches between Emacs and Vim modes
   -  surprisingly, it doesn't get in the way of Emacs' common mappings
   -  things like C-x ... still work, even in Vim mode
   -  some surprisingly complex mappings from my .vimrc work too

-  Fiplr

   -  fuzzy find in project, using ido

-  go-mode
-  python-mode
-  ruby-mode
-  php-mode

   -  this doesn't ship with Emacs and is a bit lacking really
   -  mixed HTML/PHP doesn't work well at all; I use html-mode instead

-  terraform-mode
-  Erlang
-  Skeletor
-  `apib-mode <https://github.com/w-vi/apib-mode>`__
-  Auto-complete

   -  use TAB to auto-complete while typing

-  IDO-mode

   -  ships with Emacs 24, turned on in this config
   -  does fuzzy-searching in various places

-  Molokai

   -  purdy colors, easy to read

-  Noctilux Theme

   -  Best Theme color Light Table, easy to read

-  `Neotree <https://github.com/jaypei/emacs-neotree>`__

   -  A Emacs tree plugin like NerdTree for Vim.

-  Material Theme

   -  Best Theme color, easy to read

-  ELPA

   -  the ELPA package manager is configured with Marmalade & MELPA
   -  some conveniences are in init.el to make it almost like Bundler
      for Ruby

-  `editorconfig <http://editorconfig.org/>`__

   -  config editor

-  `Google-translate <https://github.com/atykhonov/google-translate>`__
-  `feature-mode <https://github.com/michaelklishin/cucumber.el>`__
-  `gist-mode <https://github.com/defunkt/gist.el>`__

Projectile
==========

`Porjectile <https://github.com/bbatsov/projectile>`__ is a project
interaction library for Emacs. Its goal is to provide a nice set of
features operating on a project level without introducing external
dependencies(when feasible). For instance - finding project files has a
portable implementation written in pure Emacs Lisp without the use of
GNU find (but for performance sake an indexing mechanism backed by
external commands exists as well).

+-----------+------------------------+----------------+
| Binding   | Call                   | Do             |
+===========+========================+================+
| fp        | projectile-find-file   | search files   |
+-----------+------------------------+----------------+

Fixmee
======

`Fixmee <https://github.com/rolandwalker/fixmee>`__ tracks fixme notices
in code comments, highlights them, ranks them by urgency, and lets you
navigate to them quickly.

+-----------+-----------------------+---------------------+
| Binding   | Call                  | Do                  |
+===========+=======================+=====================+
| fm        | fixmee-view-listing   | show words fixmee   |
+-----------+-----------------------+---------------------+

Helm-gtags
==========

`Helm-gtags <https://github.com/syohex/emacs-helm-gtags>`__
helm-gtags-mode

+-----------+--------------------------+---------------+
| Binding   | Call                     | Do            |
+===========+==========================+===============+
| tc        | helm-gtags-create-tags   | create tags   |
+-----------+--------------------------+---------------+
| tt        | helm-gtags-find-tag      | find tag      |
+-----------+--------------------------+---------------+

Install
-------

.. code-block:: bash

    brew update
    brew install ctags
    brew install global --with-exuberant-ctags --with-pygments

.. code-block:: bash

    gtags --gtagslabel=ctags


`Plant-Uml <http://plantuml.com/>`__
====================================

`plantuml-mode <https://github.com/skuro/plantuml-mode>`__

+-----------+-------------------+---------------+
| Binding   | Call              | Do            |
+===========+===================+===============+
| p         | plantuml-viewer   | render view   |
+-----------+-------------------+---------------+

configuration
-------------

set variable ``plantuml-jar-path`` of environment

.. code-block:: bash

    export PLANTUML_JAR_PATH='~/plantuml.jar'


`Origami <https://github.com/gregsexton/origami.el>`__
======================================================

A text folding minor mode for Emacs.

With this minor mode enabled, you can collapse and expand regions of
text.

+-----------+-----------------------------------+------+
| Binding   | Call                              | Do   |
+===========+===================================+======+
| fa        | origami-toggle-all-nodes          |      |
+-----------+-----------------------------------+------+
| fr        | origami-recursively-toggle-node   |      |
+-----------+-----------------------------------+------+

Further customizations
======================

You can just edit the ~/.emacs.d/init.el file directly if you want to
make changes, though if you're planning on pulling down updates from the
git repository, you'll need to be prepared to deal with merge conflicts.
Instead, you can create a new file at ~/.emacs.d/custom.el and add your
customizations there. This file is automatically loaded at the end of of
~/.emacs.d/init.el, if it exists.

Getting updates
---------------

Disclaimer
----------

If you use my .emacs, you are probably nuts ;)


Develop
*******

Requirements
============

- `python`_
- `docker`_
- `docker compose`_

.. code-block:: bash

   $ make setup

Test
====

.. code-block:: bash

   $ make setup
   $ make docker.build env=test
   $ make test.lint

Actions
=======

Other commands for developing are written in Makefile:

.. code-block:: bash

    λ make
    ༼ つ ◕_◕ ༽つ Commands

    Usage:
        environment               create environment with pyenv
        install                   install dependences python by env
        clean                     remove files of build
        setup                     install requirements

        Docker:

            docker.build         build all services with docker-compose
            docker.down          down services docker-compose
            docker.ssh           connect by ssh to container
            docker.stop          stop services by env
            docker.verify_network           verify network
            docker.up             up services of docker-compose
            docker.run            run {service} {env}
            docker.list           list services of docker

        Docs:

            docs.show                  Show restview README
            docs.make.html             Make documentation html
            docs.make.pdf              Make documentation pdf

        Tests:

            test.lint                  Run all pre-commit
            test.syntax                Run all syntax in code

Credits
=======

Made with :heart: :coffee:️and :pizza: by `luismayta`_.

- `All Contributors`_

.. |code_climate| image:: https://codeclimate.com/github/luismayta/emacs.d/badges/gpa.svg
  :target: https://codeclimate.com/github/luismayta/emacs.d
  :alt: Code Climate

.. |github_tag| image:: https://img.shields.io/github/tag/luismayta/emacs.d.svg?maxAge=2592000
  :target: https://github.com/luismayta/emacs.d
  :alt: Github Tag

.. |build_status| image:: https://travis-ci.org/luismayta/emacs.d.svg
  :target: https://travis-ci.org/luismayta/emacs.d
  :alt: Build Status Tag

.. |wercker| image:: https://app.wercker.com/status/5197d88761e239221d963a73394f082a/s/
  :target: https://app.wercker.com/project/byKey/5197d88761e239221d963a73394f082a
  :alt: Wercker status

.. |license| image:: https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square
  :target: LICENSE
  :alt: License

.. |test_coverage| image:: https://codeclimate.com/github/luismayta/emacs.d/badges/coverage.svg
  :target: https://codeclimate.com/github/luismayta/emacs.d/coverage
  :alt: Test Coverage

.. |say_thanks| image:: https://img.shields.io/badge/SayThanks.io-%E2%98%BC-1EAEDB.svg?style=flat-square
  :target: https://saythanks.io/to/luismayta
  :alt: Say Thanks

.. Links

.. _`changelog`: CHANGELOG.rst
.. _`contributors`: AUTHORS
.. _`contributing`: CONTRIBUTING.rst
.. _`luismayta`: https://github.com/luismayta
.. _`python`: https://www.python.org
.. _`semantic versioning`: http://semver.org
.. _`Git`: http://git-scm.com/
.. _`editorconfig`: http://editorconfig.org
.. _`ctags`: http://ctags.sourceforge.net
.. _`graphviz`: http://www.graphviz.or
.. _`silver-searcher`: https://github.com/ggreer/the_silver_searcher
