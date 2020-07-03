name 'default'

default_source :supermarket

run_list 'systemd_timesyncd::default'

cookbook 'systemd_timesyncd', path: '.'

default['systemd_timesyncd']['ntp'] = [ '10.0.0.1' ]
default['systemd_timesyncd']['fallbackntp'] = [ '0.au.pool.ntp.org', '1.au.pool.ntp.org', '2.au.pool.ntp.org' ]
