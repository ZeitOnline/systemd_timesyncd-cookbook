#
# Cookbook:: systemd_timesyncd
# Recipe:: default
#

template '/etc/systemd/timesyncd.conf' do
  source 'timesyncd.conf.erb'
  variables(
    ntp: node['systemd_timesyncd']['ntp'],
    fallbackntp: node['systemd_timesyncd']['fallbackntp'],
    rootdistancemaxsec: node['systemd_timesyncd']['rootdistancemaxsec'],
    pollintervalminsec: node['systemd_timesyncd']['pollintervalminsec'],
    pollintervalmaxsec: node['systemd_timesyncd']['pollintervalmaxsec']
  )
end

service 'systemd-timesyncd.service' do
  action [:enable, :start]
  subscribes :restart, 'template[/etc/systemd/timesyncd.conf]'
end
