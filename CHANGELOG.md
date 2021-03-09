# timesyncd CHANGELOG

This file is used to list changes made in each version of the timesyncd cookbook.

# 0.1.0

Initial release.

# 0.2.0

- renamed to `systemd_timesyncd`
- moved attribute namespace
- reduced template to simpler version from https://www.freedesktop.org/software/systemd/man/timesyncd.conf.html
- added inspec tests
- testing on more platforms

# 0.3.0

- refactor to custom resource and default recipe
- matrix for supported platforms
- tests for service

# 0.3.1

- cookbook specificity for template origin from https://github.com/mattray/systemd_timesyncd-cookbook/pull/1 Thanks @frank-m

# BACKLOG
- do we need to block on ntpd/chrony? ("System clock synchronized: yes" happens with ntpd)
- do we need to /sbin/hwclock --systohc --localtime
- do we need to enable setting hardware clock to coordinated universal time (UTC): # timedatectl set-local-rtc 0
