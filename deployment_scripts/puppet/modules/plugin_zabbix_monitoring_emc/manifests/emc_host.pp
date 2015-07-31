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
define plugin_zabbix_monitoring_emc::emc_host(
  $host_group = ['EMC', 'Hardware'],
) {

  $host = split($name,':')

  if size($host) == 2 {
    plugin_zabbix_host { $host[0]:
      host     => $host[0],
      type     => 2,
      ip       => $host[1],
      port     => '161',
      api      => $plugin_zabbix::params::api_hash,
      groups   => $host_group,
    }
    plugin_zabbix_template_link { "${host[0]} Template EMC VNX":
      host     => $host[0],
      template => 'Template EMC VNX',
      api      => $plugin_zabbix::params::api_hash,
      require  => Plugin_zabbix_host[$host[0]],
    }
  }

}
