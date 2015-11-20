===================================================
EMC hardware monitoring extension for Zabbix plugin
===================================================

EMC hardware monitoring extension plugin extends Zabbix plugin functionality
by adding monitoring of incoming SNMP traps sent from EMC VNX arrays via
management network to Zabbix VIP address. For more information about
networks, see the `Logical Networks <https://docs.mirantis.com/openstack/fuel
/fuel-7.0/reference-architecture.html#logical-networks>`_ section of MOS
documentation. The plugin configures snmptt to parse and pass EMC VNX specific
traps to Zabbix. It also configures Zabbix by adding Template with appropriate
items and triggers and by creating Hosts for each EMC VNX array.

Requirements
============

================================== ===============
Requirement                        Version/Comment
================================== ===============
Fuel                               7.0
Zabbix plugin for Fuel             >= 2.0.0
SNMP trap daemon for Zabbix plugin 1.0.0
================================== ===============

