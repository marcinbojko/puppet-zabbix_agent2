# zabbix_agent2

Puppet module for managing `Zabbix Agent 2` installation and configuration.

## Table of Contents

<!-- TOC -->

- [zabbix_agent2](#zabbix_agent2)
  - [Table of Contents](#table-of-contents)
  - [Description](#description)
  - [Setup](#setup)
    - [What zabbix_agent2 affects](#what-zabbix_agent2-affects)
    - [Beginning with zabbix_agent2](#beginning-with-zabbix_agent2)
  - [Usage](#usage)
    - [Install class parameters](#install-class-parameters)
    - [Config clas parameters](#config-clas-parameters)
    - [Service class parameters](#service-class-parameters)
    - [Extra class parameters](#extra-class-parameters)
  - [Author](#author)
  - [ToDo](#todo)

<!-- /TOC -->

## Description

The `zabbix_agent2` module is used to manage zabbix-agent2 packages and configuration in several operating systems. Zabbix Agent v2 provided new integration and is expandable by plugins.

Supported operating systems:

- RedHat/CentOS 7/8
- Windows 2016/2019/10

## Setup

### What zabbix_agent2 affects

Module installs `zabbix-agent2` package from proper repository (Linux) or `Chocolatey` repository (Windows). If instructed it also removes previous agent (leaving config and logs).

### Beginning with zabbix_agent2

The very basic steps needed for a user to get the module up and running. This
can include setup steps, if necessary, or it can be an example of the most basic
use of the module.

## Usage

### Install class parameters

|name|type|description|default|
|----|----|-----------|-------|
|$manage_repo|Boolean|should module manage repository|true|
|$manage_package|Boolean|shoule module manage package|true|
|$package_ensure|String|version of package|present|
|$package_name  |String|name of zabbix-agent2 package||
|$zabbix_version|String|version of zabbix package and repo|5.2|
|$uninstall_zabbix|Optional[Boolean]|should module uninstall previous version of package|false|
|$uninstall_zabbix_package|Optional[String]|name of previous version to uninstall|zabbix-agent|
|$source        |Optional[String]|source for chocolatey package to install|[https://chocolatey.org/api/v2/](https://chocolatey.org/api/v2/)|

### Config clas parameters

|name|type|description or config variable name|default|
|----|----|-----------|-------|
|$config_dir               |Stdlib::Absolutepath|folder where config is being held||
|$config_name              |String|config filename||
|$log_file                 |Optional[Stdlib::Absolutepath]|`LogFile`||
|$pid_file                 |Optional[Stdlib::Absolutepath]|`PidFile`||
|$log_file_size            |Optional[Integer[0,1024]]|`LogFileSize`|1|
|$server                   |Optional[String]|`Server`|127.0.0.1|
|$server_active            |Optional[String]|`ServerActive`|127.0.0.1|
|$hostname                 |Optional[String]|`Hostname`||
|$include                  |Optional[String]|`Include`||
|$control_socket           |Optional[Stdlib::Absolutepath]|`ControlSocket`||
|$log_type                 |Optional[Enum['system','file','console']]|`LogType`||
|$debug_level              |Optional[Integer[0,5]]|`DebugLevel`||
|$source_ip                |Optional[Stdlib::IP::Address]|`SourceIP`||
|$listen_port              |Optional[Stdlib::Port]|`ListenPort`||
|$listen_ip                |Optional[Stdlib::IP::Address]|`ListenIP`||
|$status_port              |Optional[Stdlib::Port]|`StatusPort`||
|$hostname_item            |Optional[String]|`HostnameItem`||
|$hostname_metadata        |Optional[String]|`HostnameMetadata`||
|$hostname_metadata_item   |Optional[String]|`HostnameMetadataItem`||
|$host_interface           |Optional[String[0,255]]|`HostInterface`||
|$host_interface_item      |Optional[String]|`HostInterfaceItem`||
|$refresh_active_checks    |Optional[Integer[60,3600]]|`RefreshActiveChecks`||
|$buffer_send              |Optional[Integer[1,3600]]|`BufferSend`||
|$buffer_size              |Optional[Integer[2,65535]]|`BufferSize`||
|$enable_persistent_buffer |Optional[Integer[0,1]]|`EnablePersistentBuffer`||
|$persistent_buffer_period |Optional[String]|`PersistentBufferPeriod`||
|$persistent_buffer_file   |Optional[String]|`PersistentBufferFile`||
|$aliases                  |Optional[Array]|`Aliases`||
|$timeout                  |Optional[Integer[1,30]]|`Timeout`||
|$unsafe_user_parameter    |Optional[Integer[0,1]]|`UnsafeUserParameter`||
|$user_parameter           |Optional[Array]|`UserParameter`||
|$user_parameter_dir       |Optional[Stdlib::Absolutepath]|`UserParameterDir`||
|$user_parameter_dir_create|Optional[Boolean]|should we create dir if `UserParameter` is set|true|
|$plugins                  |Optional[Array]|`Plugins`||

### Service class parameters

|name|type|description|default|
|----|----|-----------|-------|
|$service_ensure|Enum['running', 'stopped']|state of service|running|
|$service_name|String|name of the service to manage||
|$service_enable|Boolean|should service be enabled or disabled|true|
|$service_manage|Boolean|shoudl module manage the service|true|
|$service_hasstatus|Optional[Boolean]|if service has status||
|$service_hasrestart|Optional[Boolean]|if service can be restarted||
|$service_runasroot|Optional[Boolean]|if module should create override file for systemd|false|

### Extra class parameters

|name|type|description|default|
|----|----|-----------|-------|
|$plugin_docker_add_user|Optional[Boolean]|should user zabbix be added to 'docker' group|false|
|$plugin_docker_user_name|Optional[String]|name of user to be added|zabbix|

## Author

email: marcin@bojko.com.pl

www: [https://bojko.dev](https://bojko.dev)

## ToDo

- TLS section
- add Ubuntu/Debian OS
- fix failed test
- add variable logic (variable/parameters dependency)
