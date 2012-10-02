#
# == Class: timezone::client::config
#
# === Authors
#
# Paul Belanger <paul.belanger@polybeacon.com>
#
# === Copyright
#
# Copyright (C) 2012, PolyBeacon, Inc.
#
# This program is free software, distributed under the terms
# of the Apache License, Version 2.0. See the LICENSE file at
# the top of the source tree.
#
class timezone::client::config {
  file { $timezone::params::configfile:
    ensure  => file,
    content => template('timezone/etc/timezone.erb'),
    require => Class['timezone::client::install'],
    notify  => Exec["${name}-set-timezone"],
  }

  exec { "${name}-set-timezone":
    command     => 'dpkg-reconfigure -f noninteractive tzdata',
    refreshonly => true,
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
