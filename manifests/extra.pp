# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include zabbix_agent2::extra
class zabbix_agent2::extra
inherits zabbix_agent2::params  {

  if ($zabbix_agent2::plugin_docker_add_user) and ($zabbix_agent2::plugin_docker_user_name) and ($facts['docker']) {
    case $facts['os']['family'] {
      'Redhat': {
          augeas { "docker" :
            context => "/files/etc/group/docker",
            changes => ["set /files/etc/group/docker/user[last()+1] ${zabbix_agent2::plugin_docker_user_name}"],
            onlyif  => ["values /files/etc/group/docker/user not_include ${zabbix_agent2::plugin_docker_user_name}"],
            notify  => Service['zabbix_agent2'],
          }
      }
      default: { }
    }
  }
}
