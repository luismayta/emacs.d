
Installation on Linux
---------------------

.. contents::


1. Operating System needs
~~~~~~~~~~~~~~~~~~~~~~~~~

Requires Emacs 24.5 and later. We also require to have some operating system libraries and build tools installed.
We will guide you through the steps that are required to install those requirements in this subtopic.

Debian / Ubuntu
```````````````

Install the operating system requirements by executing the following commands:

``sudo apt-get update && sudo apt-get install build-essential editorconfig curl git-core wget zsh ctags``

Fedora / RHEL based
```````````````````

Install the operating system requirements by executing the following commands:

``sudo yum install gcc build-essential editorconfig curl git-core wget zsh ctags``.

.. code-block:: bash

    emacs

To upgrade your existing installation, see our :doc:`Upgrading Guide </intro/upgrading>`.

**Head to the next step**

Configure your installation now by going to the next chapter: :doc:`/intro/configuration`.
