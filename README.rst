|wercker| |build_status| |code_climate| |github_tag| |test_coverage| |license| |say_thanks|

:Version: 1.6.3
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

-  Only Creates the necessary files and folders.
-  Blazing fast creation, forget about file creation and focus in
   actions.

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

.. _`all contributors`: AUTHORS
.. _`changelog`: CHANGELOG.rst
.. _`contributors`: AUTHORS
.. _`contributing`: CONTRIBUTING.rst
.. _`luismayta`: https://github.com/luismayta
.. _`python`: https://www.python.org
.. _`docker`: https://www.docker.io
.. _`docker compose`: https://docs.docker.com/compose
.. _`semantic versioning`: http://semver.org
.. _`Git`: http://git-scm.com/
.. _`editorconfig`: http://editorconfig.org
.. _`ctags`: http://ctags.sourceforge.net
.. _`graphviz`: http://www.graphviz.or
.. _`silver-searcher`: https://github.com/ggreer/the_silver_searcher
