# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include zabbix_agent2::install
class zabbix_agent2::install
inherits zabbix_agent2::params
{
  case $facts['os']['family'] {
    'RedHat'  : {
        if ($zabbix_agent2::uninstall_zabbix) {
          package { $zabbix_agent2::uninstall_zabbix_package:
            ensure => absent,
            notify => Exec['yum clean all']
          }
        }
        if ($zabbix_agent2::manage_repo) {
            Exec { path => ['/usr/bin', '/usr/sbin', '/bin'] }
            yumrepo { 'zabbix':
              descr    => "Zabbix Official Repository - \$basearch/",
              baseurl  => "https://repo.zabbix.com/zabbix/${zabbix_agent2::zabbix_version}/rhel/${facts['os']['release']['major']}/\$basearch/",
              gpgcheck => '1',
              enabled  => '1',
              gpgkey   => 'https://repo.zabbix.com/RPM-GPG-KEY-ZABBIX',
            }
            yumrepo { 'zabbix-nonsupported':
              descr    => "Zabbix Official Repository non-supported - \$basearch/",
              baseurl  => "https://repo.zabbix.com/non-supported/rhel/${facts['os']['release']['major']}/\$basearch/",
              gpgcheck => '1',
              enabled  => '0',
              gpgkey   => 'https://repo.zabbix.com/RPM-GPG-KEY-ZABBIX',
            }
            yumrepo { 'zabbix-frontend':
              descr    => "Zabbix Official Repository frontend - \$basearch",
              baseurl  => "https://repo.zabbix.com/zabbix/${zabbix_agent2::zabbix_version}/rhel/${facts['os']['release']['major']}/\$basearch/frontend",
              gpgcheck => '1',
              enabled  => '0',
              gpgkey   => 'https://repo.zabbix.com/RPM-GPG-KEY-ZABBIX',
            }
            yumrepo { 'zabbix-debuginfo':
              descr    => "Zabbix Official Repository debuginfo - \$basearch",
              baseurl  => "https://repo.zabbix.com/zabbix/${zabbix_agent2::zabbix_version}/rhel/${facts['os']['release']['major']}/\$basearch/debuginfo",
              gpgcheck => '1',
              enabled  => '0',
              gpgkey   => 'https://repo.zabbix.com/RPM-GPG-KEY-ZABBIX',
            }
        }
        exec { 'yum clean all':
            path        => '/usr/bin',
            user        => 'root',
            logoutput   => true,
            refreshonly => true,
            command     => 'yum clean all -y -q',
        }
        exec { 'yum makecache':
            path        => '/usr/bin',
            user        => 'root',
            logoutput   => true,
            refreshonly => true,
            command     => 'yum makecache -y -q',
        }
        if ($zabbix_agent2::manage_package) and ($zabbix_agent2::manage_repo) {
          package { $zabbix_agent2::package_name:
            ensure  => $zabbix_agent2::package_ensure,
            require => [Yumrepo['zabbix'],Exec['yum makecache']]
          }
        }
        elsif ($zabbix_agent2::manage_package) {
          package { $zabbix_agent2::package_name:
            ensure  => $zabbix_agent2::package_ensure,
            require => Exec['yum makecache']
          }
        }
      }
    'Windows'  : {
          if ($zabbix_agent2::uninstall_zabbix) {
            package { $zabbix_agent2::uninstall_zabbix_package:
              ensure   => absent,
              provider => 'chocolatey',
            }
          }
          if ($zabbix_agent2::manage_package) {
            package { $zabbix_agent2::package_name:
              ensure   => $zabbix_agent2::package_ensure,
              source   => $zabbix_agent2::source,
              provider => 'chocolatey',
            }
          }
    }
    default: {
      fail($zabbix_agent2::fail_message)
    }
  }
}
