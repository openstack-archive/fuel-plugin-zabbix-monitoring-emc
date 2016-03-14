==========
User Guide
==========

Important preliminary notes
===========================

- It is highly recommended to do a network verification check prior
  to any deployment.
- This plugin version only supports Ubuntu OS type.
- You can also choose any supervisor and/or also change the
  networking configuration according to your needs  but you can not use
  the old legacy networking mode (nova-network) as this is not supported.
- See Zabbix Plugin for Fuel Documentation for additional notes
- See Zabbix SNMP Trap Daemon Plugin for Fuel Documentation for additional notes

Known problems
==============

- `#1538617 <https://bugs.launchpad.net/fuel-plugins/+bug/1538617>`_:
  Cross-plugin display restrictions for some plugins prevent Settings tab from opening.
- See Zabbix Plugin for Fuel Documentation for additional problems
- See Zabbix SNMP Trap Daemon Plugin for Fuel Documentation for additional problems

Environment configuration
=========================

.. highlight:: none

#. Create an environment. For more information about environment creation, see
   `Mirantis OpenStack User Guide <http://docs.mirantis.com/openstack/fuel
   /fuel-7.0/user-guide.html#create-a-new-openstack-environment>`_.

#. Enable and configure Zabbix plugin for Fuel. For instructions, see Zabbix
   Plugin Guide in the `Fuel Plugins Catalog <https://www.mirantis.com
   /products/openstack-drivers-and-plugins/fuel-plugins/>`_.

#. Enable and configure SNMP trap daemon for Zabbix plugin. For instructions,
   see Zabbix Plugin Guide and Zabbix SNMP Trap Daemon Plugin Guide
   in the `Fuel Plugins Catalog <https://www.mirantis.com/products/
   openstack-drivers-and-plugins/fuel-plugins/>`_.

#. Open *Settings* tab of the Fuel web UI and scroll the page down. On the left
   choose *EMC hardware monitoring extension for Zabbix plugin*, select the
   plugin checkbox and optionally fill in *EMC hardware to monitor* parameter:

   .. image:: ../images/settings.png
      :width: 100%

   When you add your hardware to the *EMC hardware to monitor* comma separated
   list, then the plugin will automatically configure monitoring
   for this hardware in Zabbix by doing following actions:

   - create a Host with provided Name and IP address
   - link the EMC monitoring template to the Host

   If you leave the parameter empty, you will have to add your hardware to
   Zabbix manually.

#. Adjust other environment settings to your requirements and deploy the
   environment. For more information, see
   `Mirantis OpenStack User Guide <http://docs.mirantis.com/openstack/fuel
   /fuel-7.0/user-guide.html#create-a-new-openstack-environment>`_.

User Guide
==========

To test if everything is installed and configured properly, follow these steps:

#. Generate a SNMP test trap by running the following command from any node::

       # snmptrap -v 1 -c <SNMP_community> <mgmt_VIP_address> \
       '.1.3.6.1.4.1.1981' <host_ip_address> 6 6 '10' \
       .1.3.6.1.4.1.1981 s "null" .1.3.6.1.4.1.1981 s "null" \
       .1.3.6.1.4.1.1981 s "a37"

   where:

   *<SNMP_ community>*

       It is set in the SNMP trap daemon for Zabbix plugin Settings in Fuel UI:

   .. image:: ../images/snmptrapd_settings.png
      :width: 100%

   *<mgmt_VIP_address>*

       If you don’t know the address, run the following command on any node::

	 # awk '/zbx_vip_mgmt/ {n=1} n==1 && /ipaddr/ {print;exit}' \
	       /etc/astute.yaml | sed -e 's/.*: //'

       You should get the required VIP in the output::

	 192.168.0.3

   *<host_IP_address>*

       IP address of EMC hardware filled in *EMC hardware to monitor* parameter


#. After several seconds of running the snmptrap command you should see a new
   event in the Last 20 issues section of the Zabbix Dashboard (for information
   on how to login to Zabbix Web Interface see Zabbix Plugin Guide in the `Fuel
   Plugins Catalog <https://www.mirantis.com/products/
   openstack-drivers-and-plugins/fuel-plugins/>`_):

   .. image:: ../images/issues.png
      :width: 100%

   When you click on a date in the *Last change* column of one of the issues,
   you will see the **Events** page with list of events with the same type:

   .. image:: ../images/events.png
      :width: 100%

   To see a full description of the event, you have to click on event’s
   description and choose *History*, then you will see a **History** page with
   a full event description:

   .. image:: ../images/history.png
      :width: 100%

#. After clicking *Configuration* tab and selecting *Hosts* option, you will
   see a list of hosts with linked monitoring templates. There should be one
   host for every hardware listed in the *EMC hardware to monitor* plugin
   parameter:

   .. image:: ../images/hosts.png
      :width: 100%

Hardware setup
==============

You have to configure your hardware to enable SNMP traps sending. To do this,
refer to your hardware’s manual. Generally, you have to set these two
parameters on your hardware:

#. SNMP manager - set to Zabbix VIP address of your environment

   If you don’t know the address, run the following command on any node::

     # awk '/zbx_vip_mgmt/ {n=1} n==1 && /ipaddr/ {print;exit}' \
     /etc/astute.yaml | sed -e 's/.*: //'

   You should get the required VIP in the output::

     192.168.0.3

#. SNMP community - set the same value as in the *SNMP community* parameter
   from the SNMP trap daemon for Zabbix plugin settings:

   .. image:: ../images/snmptrapd_settings.png
      :width: 100%

