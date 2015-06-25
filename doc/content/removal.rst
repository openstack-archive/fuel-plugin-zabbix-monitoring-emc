=============
Removal Guide
=============

EMC hardware monitoring extension for Zabbix plugin removal
===========================================================

To uninstall EMC hardware monitoring extension for Zabbix plugin,
follow these steps:

1. Delete all Environments in which the plugin has been enabled.
2. Uninstall the plugin::

    # fuel plugins --remove zabbix_monitoring_emc==1.0.0

3. Check if the plugin was uninstalled successfully::

    # fuel plugins
    id | name                               | version | package_version
    ---|------------------------------------|---------|----------------
    1  | zabbix_monitoring                  | 1.0.0   | 2.0.0
    2  | zabbix_snmptrapd                   | 1.0.0   | 2.0.0

