EMC hardware monitoring extension for Zabbix plugin
===================================================

EMC hardware monitoring extension
---------------------------------

EMC hardware monitoring extension plugin extends Zabbix plugin functionality by
adding monitoring of incoming SNMP traps sent from EMC VNX arrays via management
network to management VIP address. It configures snmptt to parse and pass EMC
VNX specific traps to Zabbix. It also configures Zabbix by adding Template with
appropriate items and triggers and by creating Hosts for each EMC VNX array.

Requirements
------------

| Requirement                        | Version/Comment |
|:-----------------------------------|:----------------|
| Mirantis OpenStack compatibility   | 7.0, 8.0        |
| Zabbix plugin for Fuel             | 2.5.0           |
| SNMP trap daemon for Zabbix plugin | 1.0.1           |

Installation Guide
==================

EMC hardware monitoring extension for Zabbix plugin installation
----------------------------------------------------------------

To install EMC hardware monitoring extension for Zabbix plugin,
follow these steps:

1. Find and install Zabbix plugin for Fuel from
    [Fuel Plugins Catalog](https://software.mirantis.com/fuel-plugins)

2. Find and install SNMP trap daemon for Zabbix plugin from
    [Fuel Plugins Catalog](https://software.mirantis.com/fuel-plugins)

3. Download EMC hardware monitoring extension for Zabbix plugin from
    [Fuel Plugins Catalog](https://software.mirantis.com/fuel-plugins)

4. Copy the plugin on already installed Fuel Master node; ssh can be used for
    that. If you do not have the Fuel Master node yet, see
    [Quick Start Guide](https://software.mirantis.com/quick-start/) :

        # scp zabbix_monitoring_emc-2.5-2.5.0-1.noarch.rpm \
          root@<Fuel_Master_ip>:/tmp

5. Install the plugin:

        # cd /tmp
        # fuel plugins --install zabbix_monitoring_emc-1.0-1.0.1-1.noarch.rpm

6. Check if the plugin was installed successfully:

        # fuel plugins
        id | name                  | version | package_version
        ---|-----------------------|---------|----------------
        1  | zabbix_monitoring     | 2.5.0   | 3.0.0
        2  | zabbix_snmptrapd      | 1.0.1   | 2.0.0
        3  | zabbix_monitoring_emc | 1.0.1   | 2.0.0

For more information and instructions, see the EMC hardware monitoring extension
for Zabbix plugin Guide in the
[Fuel Plugins Catalog](https://software.mirantis.com/fuel-plugins)

Release Notes
-------------

This is the first release of the plugin.

Contributors
------------

Dmitry Klenov <dklenov@mirantis.com> (PM)  
Piotr Misiak <pmisiak@mirantis.com> (developer)  
Szymon Bańka <sbanka@mirantis.com> (developer)  
Alexander Zatserklyany <azatserklyany@mirantis.com> (QA engineer)  
Swann Croiset <scroiset@mirantis.com> (developer)
Olivier Bourdon <obourdon@mirantis.com> (developer)
