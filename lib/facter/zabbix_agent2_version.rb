Facter.add('zabbix_agent2_version') do
  confine osfamily: 'Redhat'
  setcode do
    begin
      zabbix_agent2_version = nil
      if Facter::Util::Resolution.which('zabbix_agent2')
        zabbix_agent2_version = Facter::Util::Resolution.exec('/usr/sbin/zabbix_agent2 -V|grep zabbix_agent2|awk {\'print $3\'}')
      else
        zabbix_agent2_version
      end
    rescue
      nil
    end
    zabbix_agent2_version
  end
end
Facter.add('zabbix_agent2_version') do
  confine osfamily: 'Windows'
  setcode do
    begin
      zabbix_agent2_version = nil
      if Facter::Util::Resolution.exec('choco')
        output = Facter::Util::Resolution.exec('choco list -l -r zabbix-agent2')
        success = $CHILD_STATUS.to_i
        if success
          output.each_line do |line|
            key, value = line.split('|', 2)
            value = value.to_s.strip
            #key = key.to_s.strip
            zabbix_agent2_version = value
          end
       end
      else
        zabbix_agent2_version
      end
    rescue
      nil
    end
    zabbix_agent2_version
  end
end
