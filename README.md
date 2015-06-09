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
| Mirantis OpenStack compatibility   | 6.1             |
| Zabbix for Fuel plugin             | 1.0.0           |
| SNMP trap daemon for Zabbix plugin | 1.0.0           |

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

        # scp zabbix_monitoring_emc-1.0-1.0.0-1.noarch.rpm root@<Fuel_Master_ip>:/tmp

5. Install the plugin:

        # cd /tmp
        # fuel plugins --install zabbix_monitoring_emc-1.0-1.0.0-1.noarch.rpm

6. Check if the plugin was installed successfully:

        # fuel plugins
        id | name                  | version | package_version
        ---|-----------------------|---------|----------------
        1  | zabbix_monitoring     | 1.0.0   | 2.0.0
        2  | zabbix_snmptrapd      | 1.0.0   | 2.0.0
        3  | zabbix_monitoring_emc | 1.0.0   | 2.0.0


EMC hardware monitoring extension for Zabbix plugin configuration
-----------------------------------------------------------------

1. Create an environment.
2. Enable Zabbix for Fuel plugin on the Settings tab of the Fuel web UI.
3. Enable SNMP trap daemon for Zabbix plugin on the Settings tab of the Fuel
   web UI.
4. Enable EMC hardware monitoring extension for Zabbix plugin on the Settings
   tab of the Fuel web UI.
5. Optionally, fill in values in the form:
   * EMC hardware to monitor - comma separated NAME:IP values for each EMC VNX
     array from which SNMP traps will be send
6. Deploy the environment.

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
