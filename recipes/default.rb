#
# Cookbook:: timesyncd
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

template '/etc/systemd/timesyncd.conf' do
  source 'timesyncd.conf.erb'
  variables(
    ntp: node['timesyncd']['NTP'],
    fallbackntp: node['timesyncd']['FallbackNTP'],
    rootdistancemaxsec: node['timesyncd']['RootDistanceMaxSec'],
    pollintervalminsec: node['timesyncd']['PollIntervalMinSec'],
    pollintervalmaxsec: node['timesyncd']['PollIntervalMaxSec']
  )
end

service 'systemd-timesyncd.service' do
  action [:enable, :start]
  subscribes :restart, 'template[/etc/systemd/timesyncd.conf]'
end
