# Configure a ceph osd node
#
# == Parameters
#
# [*osd_addr*] The osd's address.
#   Optional. Defaults to the $ipaddress fact.
#
# == Dependencies
#
# none
#
# == Authors
#
#  François Charlier francois.charlier@enovance.com
#  Daniele Stroppa   strp@zhaw.ch
#
# == Copyright
#
# Copyright 2012 eNovance <licensing@enovance.com>
#

class ceph::osd (
  $public_address  = $::ipaddress,
  $cluster_address = $::ipaddress,
) {

  include 'ceph::package'
  include 'ceph::params'

  info('Entering osd.pp')

  $fs = $::ceph::params::fs_type
  info('Filesystem is ${fs}')

  if $::ceph::params::fs_type == 'btrfs' {
    ensure_packages( [ 'btrfs-tools', 'parted' ] )
    info('BTRFS dependencies installed')
  }
  else {
    ensure_packages( [ 'xfsprogs', 'parted' ] )
    info('XFS dependencies installed')
  }

  Package['ceph'] -> Ceph::Key <<| title == 'admin' |>>

}

