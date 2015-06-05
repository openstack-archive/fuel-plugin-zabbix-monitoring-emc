#
#    Copyright 2015 Mirantis, Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.
#
class plugin_zabbix_monitoring_emc::snmptt_config {

  file { '/etc/snmp/snmptt.conf.d':
    ensure     => directory,
    owner      => 'root',
    group      => 'root',
    mode       => '0755',
  }

  file { '/etc/snmp/snmptt.conf.d/emc.conf':
    ensure     => present,
    owner      => 'root',
    group      => 'root',
    mode       => '0644',
    source     => 'puppet:///modules/plugin_zabbix_monitoring_emc/snmptt_emc.conf',
    require    => File['/etc/snmp/snmptt.conf.d'],
  }

  file_line { 'add emc.conf config to snmptt.ini':
    path       => '/etc/snmp/snmptt.ini',
    after      => 'snmptt_conf_files = <<END',
    line       => '/etc/snmp/snmptt.conf.d/emc.conf',
    require    => File['/etc/snmp/snmptt.conf.d/emc.conf'],
    notify     => Service['snmptt'],
  }

  service { 'snmptt':
    ensure     => running,
    enable     => true,
  }

}
