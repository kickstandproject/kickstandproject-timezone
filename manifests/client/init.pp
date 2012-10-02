#
# == Class: timezone::client::init
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
class timezone::client::init {
  include timezone::params
  include timezone::client::install
  include timezone::client::config

  File {
    group => $timezone::params::group,
    mode  => $timezone::params::mode,
    owner => $timezone::params::owner,
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
