Welcome to Emacs.d documentation!
=================================

..  image:: /_static/logo/logo.png
    :scale: 30%
    :align: right

Works only with Emacs 24 and later.

This is my configuration for Emacs. I like to keep my emacs nice and
lightweight, so there's not much in here. Actually, it's more like
Vim-flavoured Emacs, since it has Evil installed, the encoding of files
is in utf-8

**Features**:

* Core: .
* Package: Are independent for emacs.

Do you want to install, head towards our :doc:`Getting Started Manual </intro/index>`.
Want to see Emacs in action, head to :ref:`screenshots-ref`.

The code is open source, and `available on GitHub`_.

.. _available on GitHub: https://github.com/luismayta/emacs.d

The main documentation for the site is organized into a couple sections:

* :ref:`user-docs`
* :ref:`packages-docs`
* :ref:`about-docs`

Information about development of packages and the core is also available under:

* :ref:`dev-docs`


..  _user-docs:

..  toctree::
    :maxdepth: 2
    :caption: User Documentation

    intro/index
    intro/configuration
    intro/starting
    intro/upgrading
    howto/index


.. _packages-docs:

..  toctree::
    :maxdepth: 1
    :glob:
    :caption: Package Documentation

    packages/contrib/index


.. _dev-docs:

..  toctree::
    :maxdepth: 2
    :caption: Developer Documentation

    architecture/index
    packages/index

    core/index


.. _about-docs:

..  toctree::
    :maxdepth: 1
    :caption: About Emacs

    support
    changelog
    todo


.. _screenshots-ref:

Screenshots
===========

.. image:: /_static/screenshots/tm_1.png


Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`


Links
=====

| GitHub: https://github.com/luismayta/emacs.d

.. include:: _templates/links.rst
