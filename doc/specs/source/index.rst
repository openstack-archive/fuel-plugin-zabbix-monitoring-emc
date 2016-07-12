..
 This work is licensed under the Apache License, Version 2.0.

 http://www.apache.org/licenses/LICENSE-2.0

===================================================
EMC hardware monitoring extension for Zabbix plugin
===================================================

EMC hardware monitoring extension plugin expands Zabbix plugin functionality by
adding monitoring of incoming SNMP traps sent from EMC VNX arrays via management
network to management VIP address. It configures snmptt to parse and pass EMC
VNX specific traps to Zabbix. It also configures Zabbix by adding Template with
appropriate items and triggers and by creating Hosts for each EMC VNX array.

Problem description
===================

Currently, Zabbix plugin for Fuel has no support for receiving and analyzing
EMC VNX specific SNMP traps. EMC hardware monitoring extension for Zabbix plugin
aims to provide a support for it.

Proposed change
===============

Implement a Fuel plugin that will configure snmptt and Zabbix for
receiving and parsing EMC VNX specific SNMP traps.

Alternatives
------------

It might have been implemented as part of Zabbix plugin for Fuel but we decided
to make it as a separate plugin for several reasons:

* This isn't something that all operators may want to deploy.
* Any new additional functionality makes the project's testing more difficult,
  which is an additional risk for the Zabbix plugin for Fuel release.

Data model impact
-----------------

None

REST API impact
---------------

None

Upgrade impact
--------------

None

Security impact
---------------

None

Notifications impact
--------------------

None

Other end user impact
---------------------

None

Performance Impact
------------------

None

Other deployer impact
---------------------

None

Developer impact
----------------

None

Implementation
==============

The plugin configures snmptt by adding EMC VNX specific SNMP traps definitions.
It also configures Zabbix by doing following actions:

* imports an EMC VNX monitoring template to Zabbix
* creates Host for each EMC VNX array which will be sending SNMP traps
* links EMC VNX monitoring template to created Hosts

The plugin has two tasks:

* The first task configures Zabbix.
* The second task configures snmptt on Controller nodes.

Assignee(s)
-----------

| Dmitry Klenov <dklenov@mirantis.com> (PM)
| Piotr Misiak <pmisiak@mirantis.com> (developer)
| Szymon Bańka <sbanka@mirantis.com> (developer)
| Alexander Zatserklyany <azatserklyany@mirantis.com> (QA engineer)
| Swann Croiset <scroiset@mirantis.com> (developer)
| Olivier Bourdon <obourdon@mirantis.com> (developer)

Work Items
----------

* Implement the Fuel plugin.
* Implement the Puppet manifests.
* Testing.
* Write the documentation.

Dependencies
============

* Fuel 7.0, 8.0 and 9.0
* Zabbix plugin for Fuel 2.6.0
* SNMP trap daemon for Zabbix plugin 1.1.0

Testing
=======

* Prepare a test plan.
* Test the plugin by deploying environments with all Fuel deployment modes.

Documentation Impact
====================

* User Guide (which features the plugin provides, how to use them in the
  deployed OpenStack environment).
* Test Plan.
* Test Report.

References
==========

* `Zabbix Documentation - SNMP traps
  <https://www.zabbix.com/documentation/2.4/manual/config/items/itemtypes/snmptrap>`_
