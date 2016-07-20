==================
Installation Guide
==================

Installing EMC hardware monitoring extension
============================================

To install EMC hardware monitoring extension for Zabbix plugin, follow these
steps:

.. highlight:: none

#. Download and install the Zabbix plugin for Fuel from the
   `Fuel Plugins Catalog <https://www.mirantis.com/products/
   openstack-drivers-and-plugins/fuel-plugins/>`_.

#. Download and install the SNMP trap daemon for Zabbix plugin from the
   `Fuel Plugins Catalog <https://www.mirantis.com/products/
   openstack-drivers-and-plugins/fuel-plugins/>`_.

#. Download the EMC hardware monitoring extension for Zabbix plugin from the
   `Fuel Plugins Catalog <https://www.mirantis.com/products/
   openstack-drivers-and-plugins/fuel-plugins/>`_.

#. Copy all three plugins from your local machine to a previously deployed
   Fuel Master node using ssh. If you do not have the Fuel Master node yet,
   see `Quick Start Guide <https://software.mirantis.com/quick-start/>`_::

    # scp zabbix_monitoring-2.5-2.5.1-1.noarch.rpm \
      root@<Fuel_Master_IP>:/tmp
    # scp zabbix_snmptrapd-1.1-1.1.0-1.noarch.rpm \
      root@<Fuel_Master_IP>:/tmp
    # scp zabbix_monitoring_emc-1.1-1.1.0-1.noarch.rpm \
      root@<The_Fuel_Master_node_IP>:/tmp

#. Log into the Fuel Master node. Install each of the three plugins using
   the following commands::

    # cd /tmp
    # fuel plugins --install \
      zabbix_monitoring-2.5-2.5.1-1.noarch.rpm
    # fuel plugins --install \
      zabbix_snmptrapd-1.1-1.1.0-1.noarch.rpm
    # fuel plugins --install \
      zabbix_monitoring_emc-1.1-1.1.0-1.noarch.rpm

#. Make sure the plugins were installed correctly::

    # fuel plugins
    id | name                      | version  | package_version
    ---|---------------------------|----------|----------------
    1  | zabbix_monitoring         | 2.5.1    | 3.0.0
    2  | zabbix_snmptrapd          | 1.1.0    | 3.0.0
    3  | zabbix_monitoring_emc     | 1.1.0    | 3.0.0

EMC hardware monitoring extension removal
=========================================

To uninstall EMC hardware monitoring extension for Zabbix plugin,
follow these steps:

#. Delete all environments in which EMC hardware monitoring extension for Zabbix plugin has been enabled.

#. Uninstall the plugin::

     # fuel plugins --remove zabbix_monitoring_emc==1.1.0

#. Check if the plugin was uninstalled successfully::

     # fuel plugins
     id | name                      | version  | package_version
     ---|---------------------------|----------|----------------
     ...
     You can still have other plugins listed here but not zabbix_monitoring_emc

