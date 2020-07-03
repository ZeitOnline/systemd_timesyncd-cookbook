# systemd_timesyncd Cookbook

[systemd-timesyncd](https://www.freedesktop.org/software/systemd/man/systemd-timesyncd.service.html) is a service that has been added to `systemd` for synchronizing the system clock across the network with a remote Network Time Protocol server and is included in most recent Linux distributions. Similar to `ntpd` or `chrony` yet simpler in the implementation, it is considered sufficient for most Linux machines' time synchronization requirements.

## Supported Platforms

Full support for `systemd-timesyncd` varies by Linux distribution versions. Red Hat has chosen not to ship it in favor of `chrony`.

| Distribution Version | Supported |
| Amazon Linux 2.0 | no |
| CentOS/Red Hat 6 | no |
| CentOS/Red Hat 7 | no |
| CentOS/Red Hat 8 | no |
| Debian 8 | yes |
| Debian 9 | yes |
| Debian 10 | yes |
| SUSE Enterprise Linux Server 15 | yes |
| Ubuntu 16.04 | yes |
| Ubuntu 18.04 | yes |
| Ubuntu 20.04 | yes |

## Custom Resource
This resource will write out a `/etc/systemd/timesyncd.conf` for configuration and supports the actions `enable` and `start` the `systemd-timesyncd.service`.

```
systemd_timesyncd 'Configure systemd_timesyncd as a client' do
    ntp ['10.0.0.1']
    fallbackntp ['0.arch.pool.ntp.org','1.arch.pool.ntp.org']
    action [:enable, :start]
end
```

## Properties

The properties map to the options listed in the [timesyncd.conf](https://www.freedesktop.org/software/systemd/man/timesyncd.conf.html#Options) documentation.

- `ntp`: A space-separated list of NTP server host names or IP addresses. During runtime this list is combined with any per-interface NTP servers acquired from systemd-networkd.service. systemd-timesyncd will contact all configured system or per-interface servers in turn until one is found that responds. When the empty string is assigned, the list of NTP servers is reset, and all assignments prior to this one will have no effect. This setting defaults to an empty list.
- `fallbackntp`: A space-separated list of NTP server host names or IP addresses. During runtime this list is combined with any per-interface NTP servers acquired from systemd-networkd.service. systemd-timesyncd will contact all configured system or per-interface servers in turn until one is found that responds. When the empty string is assigned, the list of NTP servers is reset, and all assignments prior to this one will have no effect. This setting defaults to an empty list.
- `rootdistancemaxsec`: Maximum acceptable root distance. Takes a time value (in seconds). Defaults to 5 seconds.
- `pollintervalminsec`, `pollintervalmaxsec`: The minimum and maximum poll intervals for NTP messages. Each setting takes a time value (in seconds). PollIntervalMinSec= must not be smaller than 16 seconds. PollIntervalMaxSec= must be larger than PollIntervalMinSec=. PollIntervalMinSec= defaults to 32 seconds, and PollIntervalMaxSec= defaults to 2048 seconds.

## Actions

`:disable`: Disable the `systemd-timesyncd` service.
`:enable`: Enable the `systemd-timesyncd` service at boot.
`:restart`: Restart the `systemd-timesyncd` service.
`:start`: Start the `systemd-timesyncd` service, and keep it running until stopped or disabled.
`:stop`: Stop the `systemd-timesyncd` service.

## Default Recipe

The default recipe simply calls the custom resource with `:enable` and `:start`, passing the node attributes.

## Attributes

The [attributes](attributes/default.rb) file provided defaults that map to the defaults provided by the [timesyncd.conf](https://www.freedesktop.org/software/systemd/man/timesyncd.conf.html#Options) documentation.
