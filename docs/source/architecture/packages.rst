
packages Architecture
----------------------

More information about the apps itself, please go to :doc:`Packages Dev Documentation </packages/index>`

.. uml::

    interface "Data Access" as DA

    DA - [First Component] 
    [First Component] ..> HTTP : use

    note left of HTTP : Web Service only

    note right of [First Component]
    A note can also
    be on several lines
    end note
