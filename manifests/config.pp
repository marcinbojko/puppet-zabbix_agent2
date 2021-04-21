# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include zabbix_agent2::config
class zabbix_agent2::config
inherits zabbix_agent2::params {

  file { "${zabbix_agent2::config_dir}":
    ensure => directory,
  }
case $facts['os']['family'] {
  'RedHat'  : {
    if ($zabbix_agent2::user_parameter_dir) and ($zabbix_agent2::user_parameter_dir_create) {
      file { "${$zabbix_agent2::user_parameter_dir}":
        ensure => directory,
        owner  => zabbix,
        group  => zabbix,
        mode   => '0644',
      }
    }
    file { "${zabbix_agent2::config_dir}/${zabbix_agent2::config_name}":
      ensure  => file,
      owner   => 0,
      group   => 0,
      mode    => '0644',
      content => epp('zabbix_agent2/zabbix_agent2.conf.epp'),
      require => File["${zabbix_agent2::config_dir}"],
      notify  => Service['zabbix_agent2']
    }
    }
  'Windows'  : {
    if ($zabbix_agent2::user_parameter_dir) and ($zabbix_agent2::user_parameter_dir_create) {
      file { "${$zabbix_agent2::user_parameter_dir}":
        ensure => directory,
      }
    }
    file { "${zabbix_agent2::config_dir}/${zabbix_agent2::config_name}":
      ensure  => file,
      mode    => '0644',
      content => epp('zabbix_agent2/zabbix_agent2.conf.epp'),
      require => File["${zabbix_agent2::config_dir}"],
      notify  => Service["${$zabbix_agent2::service_name}"]
    }
  }
  default: {
    fail($zabbix_agent2::fail_message)
  }
}
}#of module
