
Core Architecture
-----------------

The architecture of the core and packages is described in the sections bellow.

.. uml::

    autonumber
    emacs -> init.el : package-refresh-content
    emacs -> init.el : settings paths
    emacs -> init.el : load files with require
    init.el -> "core/core/modules.el" : core/load-modules
    init.el -> emacs : message finish


.. note::

  This image is only describing the most important core components, some components are not shown here.
