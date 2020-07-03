#
# Cookbook:: systemd_timesyncd
# Recipe:: default
#

systemd_timesyncd 'Configure systemd-timesyncd' do
  ntp node['systemd_timesyncd']['ntp']
  fallbackntp node['systemd_timesyncd']['fallbackntp']
  rootdistancemaxsec node['systemd_timesyncd']['rootdistancemaxsec']
  pollintervalminsec node['systemd_timesyncd']['pollintervalminsec']
  pollintervalmaxsec node['systemd_timesyncd']['pollintervalmaxsec']
  action [:enable, :start]
end
