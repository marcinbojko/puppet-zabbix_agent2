# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include zabbix_agent2::service
class zabbix_agent2::service
inherits zabbix_agent2::params {
  case $facts['os']['family'] {
      'RedHat'  : {
        if ($zabbix_agent2::service_manage) {
          service { 'zabbix_agent2':
            ensure     => $zabbix_agent2::service_ensure,
            enable     => $zabbix_agent2::service_enable,
            name       => $zabbix_agent2::service_name,
            hasstatus  => $zabbix_agent2::service_hasstatus,
            hasrestart => $zabbix_agent2::service_hasrestart,
          }
        }
      }
      'Windows' : {
        if ($zabbix_agent2::service_manage) {
          service { "${$zabbix_agent2::service_name}":
            ensure => $zabbix_agent2::service_ensure,
            enable => $zabbix_agent2::service_enable,
          }
        }
      }
      default: {
      fail($zabbix_agent2::fail_message)
    }
  }
}

