# Changelog

All notable changes to this project will be documented in this file.

## Release 0.1.5 - 2021-05-06

* introduced downcase for `HostInterfaceItem`
* added multiple gpgkeys for zabbix yum repository

## Release 0.1.4 - 2021-04-27

* removed defaults from zabbix_config template for `HostnameItem`
* introduced downcase for `Hostname` and `HostInterface`
* added `chocolatey` as required provider
* fixed tests

## Release 0.1.3 - 2021-04-22

* added `service_runasroot` parameter for zabbix instances required to run with root privileges
* fixed inconsistency in notyfing services after config change

## Release 0.1.2 - 2021-04-22

* added documentation section (class and parameters description)
* added 'uninstall old package' for `Windows` operating system
* added fact `zabbix_agent2_version` for `Windows` operating system

## Release 0.1.1 - 2021-04-21

* Initial release
