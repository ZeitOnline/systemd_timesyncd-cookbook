provides :systemd_timesyncd

property :ntp, Array
property :fallbackntp, Array
property :rootdistancemaxsec, Integer
property :pollintervalminsec, Integer
property :pollintervalmaxsec, Integer

default_action :enable

action :disable do
  service 'systemd-timesyncd.service' do
    action :disable
  end
end

action :enable do
  timesyncd(:enable,
            new_resource.ntp,
            new_resource.fallbackntp,
            new_resource.rootdistancemaxsec,
            new_resource.pollintervalminsec,
            new_resource.pollintervalmaxsec)
end

action :restart do
  timesyncd(:restart,
            new_resource.ntp,
            new_resource.fallbackntp,
            new_resource.rootdistancemaxsec,
            new_resource.pollintervalminsec,
            new_resource.pollintervalmaxsec)
end

action :start do
  timesyncd(:start,
            new_resource.ntp,
            new_resource.fallbackntp,
            new_resource.rootdistancemaxsec,
            new_resource.pollintervalminsec,
            new_resource.pollintervalmaxsec)
end

action :stop do
  service 'systemd-timesyncd.service' do
    action :stop
  end
end

action_class do
  def timesyncd(action, ntp, fallbackntp, rootdistancemaxsec, pollintervalminsec, pollintervalmaxsec)
    template '/etc/systemd/timesyncd.conf' do
      source 'timesyncd.conf.erb'
      cookbook 'systemd_timesyncd'
      variables(
                ntp: ntp,
                fallbackntp: fallbackntp,
                rootdistancemaxsec: rootdistancemaxsec,
                pollintervalminsec: pollintervalminsec,
                pollintervalmaxsec: pollintervalmaxsec
              )
    end

    service 'systemd-timesyncd.service' do
      action action
      subscribes :restart, 'template[/etc/systemd/timesyncd.conf]'
    end
  end
end
