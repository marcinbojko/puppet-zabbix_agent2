# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include zabbix_agent2
class zabbix_agent2 (
  # settings for install class
  Boolean                                   $manage_repo              = $zabbix_agent2::params::manage_repo,
  Boolean                                   $manage_package           = $zabbix_agent2::params::manage_package,
  String                                    $package_ensure           = $zabbix_agent2::params::package_ensure,
  String                                    $package_name             = $zabbix_agent2::params::package_name,
  String                                    $zabbix_version           = $zabbix_agent2::params::zabbix_version,
  String                                    $fail_message             = $zabbix_agent2::params::fail_message,
  Optional[Boolean]                         $uninstall_zabbix         = $zabbix_agent2::params::uninstall_zabbix,
  Optional[String]                          $uninstall_zabbix_package = $zabbix_agent2::params::uninstall_zabbix_package,
  Optional[String]                          $source                   = $zabbix_agent2::params::source,
  Optional[Boolean]                         $service_runasroot        = $zabbix_agent2::params::service_runasroot,
  # settings for config class
  Stdlib::Absolutepath                      $config_dir               = $zabbix_agent2::params::config_dir,
  String                                    $config_name              = $zabbix_agent2::params::config_name,
  Optional[Stdlib::Absolutepath]            $log_file                 = $zabbix_agent2::params::log_file,
  Optional[Stdlib::Absolutepath]            $pid_file                 = $zabbix_agent2::params::pid_file,
  Optional[Integer[0,1024]]                 $log_file_size            = $zabbix_agent2::params::log_file_size,
  Optional[String]                          $server                   = $zabbix_agent2::params::server,
  Optional[String]                          $server_active            = $zabbix_agent2::params::server_active,
  Optional[String]                          $hostname                 = $zabbix_agent2::params::hostname,
  Optional[String]                          $include                  = $zabbix_agent2::params::include,
  Optional[Stdlib::Absolutepath]            $control_socket           = $zabbix_agent2::params::control_socket,
  Optional[Enum['system','file','console']] $log_type                 = $zabbix_agent2::params::log_type,
  Optional[Integer[0,5]]                    $debug_level              = $zabbix_agent2::params::debug_level,
  Optional[Stdlib::IP::Address]             $source_ip                = $zabbix_agent2::params::source_ip,
  Optional[Stdlib::Port]                    $listen_port              = $zabbix_agent2::params::listen_port,
  Optional[Stdlib::IP::Address]             $listen_ip                = $zabbix_agent2::params::listen_ip,
  Optional[Stdlib::Port]                    $status_port              = $zabbix_agent2::params::status_port,
  Optional[String]                          $hostname_item            = $zabbix_agent2::params::hostname_item,
  Optional[String]                          $hostname_metadata        = $zabbix_agent2::params::hostname_metadata,
  Optional[String]                          $hostname_metadata_item   = $zabbix_agent2::params::hostname_metadata_item,
  Optional[String[0,255]]                   $host_interface           = $zabbix_agent2::params::host_interface,
  Optional[String]                          $host_interface_item      = $zabbix_agent2::params::host_interface_item,
  Optional[Integer[60,3600]]                $refresh_active_checks    = $zabbix_agent2::params::refresh_active_checks,
  Optional[Integer[1,3600]]                 $buffer_send              = $zabbix_agent2::params::buffer_send,
  Optional[Integer[2,65535]]                $buffer_size              = $zabbix_agent2::params::buffer_size,
  Optional[Integer[0,1]]                    $enable_persistent_buffer = $zabbix_agent2::params::enable_persistent_buffer,
  Optional[String]                          $persistent_buffer_period = $zabbix_agent2::params::persistent_buffer_period,
  Optional[String]                          $persistent_buffer_file   = $zabbix_agent2::params::persistent_buffer_file,
  Optional[Array]                           $aliases                  = $zabbix_agent2::params::aliases,
  Optional[Integer[1,30]]                   $timeout                  = $zabbix_agent2::params::timeout,
  Optional[Integer[0,1]]                    $unsafe_user_parameter    = $zabbix_agent2::params::unsafe_user_parameter,
  Optional[Array]                           $user_parameter           = $zabbix_agent2::params::user_parameter,
  Optional[Stdlib::Absolutepath]            $user_parameter_dir       = $zabbix_agent2::params::user_parameter_dir,
  Optional[Boolean]                         $user_parameter_dir_create= $zabbix_agent2::params::user_parameter_dir_create,
  Optional[Array]                           $plugins                  = $zabbix_agent2::params::plugins,
  # settings for service class
  Enum['running', 'stopped']                $service_ensure           = $zabbix_agent2::params::service_ensure,
  String                                    $service_name             = $zabbix_agent2::params::service_name,
  Boolean                                   $service_enable           = $zabbix_agent2::params::service_enable,
  Boolean                                   $service_manage           = $zabbix_agent2::params::service_manage,
  Optional[Boolean]                         $service_hasstatus        = $zabbix_agent2::params::service_hasstatus,
  Optional[Boolean]                         $service_hasrestart       = $zabbix_agent2::params::service_hasrestart,
  # extra class
  Optional[Boolean]                         $plugin_docker_add_user   = $zabbix_agent2::params::plugin_docker_add_user,
  Optional[String]                          $plugin_docker_user_name  = $zabbix_agent2::params::plugin_docker_user_name,
)
inherits zabbix_agent2::params {
  contain zabbix_agent2::install
  contain zabbix_agent2::config
  contain zabbix_agent2::service
  contain zabbix_agent2::extra

Class['::zabbix_agent2::install']
  -> Class['::zabbix_agent2::config']
  -> Class['::zabbix_agent2::service']
} #end

