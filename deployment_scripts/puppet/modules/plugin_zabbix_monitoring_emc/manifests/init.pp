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
class plugin_zabbix_monitoring_emc(
  $host_group = 'EMC',
)
{

  include plugin_zabbix::params

  file { '/etc/zabbix/import/Template_EMC_VNX.xml':
    ensure     => present,
    source     => 'puppet:///modules/plugin_zabbix_monitoring_emc/Template_EMC_VNX.xml',
  }

  plugin_zabbix_configuration_import { 'Template_EMC_VNX.xml Import':
    ensure     => present,
    xml_file   => '/etc/zabbix/import/Template_EMC_VNX.xml',
    api        => $plugin_zabbix::params::api_hash,
    require    => File['/etc/zabbix/import/Template_EMC_VNX.xml'],
  }

  plugin_zabbix_hostgroup {$host_group:
    ensure     => present,
    api        => $plugin_zabbix::params::api_hash,
  }

  $zabbix_monitoring_emc_hash = hiera('zabbix_monitoring_emc')
  $hosts_string = $zabbix_monitoring_emc_hash['hosts']

  if $hosts_string {
    $hosts = split($hosts_string,',')

    if size($hosts) > 0 {
      plugin_zabbix_monitoring_emc::emc_host { $hosts:
        host_group => $host_group,
      }
      Plugin_zabbix_configuration_import<||> -> Plugin_zabbix_monitoring_emc::Emc_host<||>
      Plugin_zabbix_hostgroup<||> -> Plugin_zabbix_monitoring_emc::Emc_host<||>
    }
  }

}
