Installation on OSX
-------------------

.. contents::


1. Operating System needs
~~~~~~~~~~~~~~~~~~~~~~~~~

Requires Emacs 24 and later. We also require to have some operating system libraries and build tools installed.
We will guide you through the steps that are required to install those requirements in this subtopic.

Install the operating system requirements by executing the following commands:

.. code-block:: bash

    brew install the_silver_searcher editorconfig \
    aspell --with-lang-en ctags \
    global --with-exuberant-ctags --with-pygments \
    graphviz markdown


2. Installation
~~~~~~~~~~~~~~~

via curl
--------

.. code-block:: bash

    sh -c "$(curl -fsSL https://raw.github.com/luismayta/emacs.d/master/install.sh)"

via wget
--------

.. code-block:: bash

    sh -c "$(wget https://raw.github.com/luismayta/emacs.d/master/install.sh -O -)"

**Head to the next step**

Configure your emacs.d installation now by going to the next chapter: :doc:`/intro/configuration`.
