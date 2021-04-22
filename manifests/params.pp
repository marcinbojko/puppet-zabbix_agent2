# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include zabbix_agent2::params
class zabbix_agent2::params {

# settings for install class
$manage_repo              = true
$manage_package           = true
$package_ensure           = 'present'
$zabbix_version           = '5.2'
$uninstall_zabbix         = false
# settings for config class
$log_file_size            = 1
$server                   = undef
$server_active            = undef
$hostname                 = undef
$include                  = undef
$control_socket           = undef
$log_type                 = undef
$debug_level              = undef
$source_ip                = undef
$listen_port              = undef
$listen_ip                = undef
$status_port              = undef
$hostname_item            = undef
$hostname_metadata        = undef
$hostname_metadata_item   = undef
$host_interface           = undef
$host_interface_item      = undef
$refresh_active_checks    = undef
$buffer_send              = undef
$buffer_size              = undef
$enable_persistent_buffer = undef
$persistent_buffer_period = undef
$persistent_buffer_file   = undef
$aliases                  = undef
$timeout                  = undef
$user_parameter           = undef
$unsafe_user_parameter    = undef
$user_parameter_dir       = undef
$user_parameter_dir_create= true
$plugins                  = undef

# settings for service class
$service_ensure           = 'running'
$service_manage           = true
$service_enable           = true

# extra
$plugin_docker_add_user   = false
$plugin_docker_user_name  = 'zabbix'

# the rest
$fail_message             = "${facts['os']['family']} is not supported by this module."

  case $facts['os']['family'] {

    'Redhat': {
      $package_name             = 'zabbix-agent2'
      $config_dir               = '/etc/zabbix'
      $log_file                 = '/var/log/zabbix/zabbix_agent2.log'
      $pid_file                 = '/tmp/zabbix_agent2.pid'
      $service_name             = 'zabbix-agent2'
      $service_hasrestart       = true
      $service_hasstatus        = true
      $config_name              = 'zabbix_agent2.conf'
      $uninstall_zabbix_package = 'zabbix-agent'
      $source                   = undef
    }
    'Windows': {
      $package_name             = 'zabbix-agent2'
      $config_dir               = 'C:\Program Files\zabbix-agent2'
      $log_file                 = 'C:\Program Files\zabbix-agent2\zabbix_agent2.log'
      $pid_file                 = 'C:\Program Files\zabbix-agent2\zabbix_agent2.pid'
      $source                   = 'https://chocolatey.org/api/v2/'
      $service_name             = 'Zabbix Agent 2'
      $service_hasrestart       = true
      $service_hasstatus        = true
      $config_name              = 'zabbix_agent2.conf'
      $uninstall_zabbix_package = 'zabbix-agent3'
    }
    default: {
      $package_name   = undef
      $config_dir     = undef
      $log_file       = undef
      $source         = undef
      $service_name   = undef
      $config_name    = undef
      $pid_file       = undef
      $buffer_send    = undef
      $service_hasrestart = true
      $service_hasstatus  = true
      fail($fail_message)
    }
  } #end case
}
