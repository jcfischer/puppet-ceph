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

  if $::ceph::params::fs_type == 'btrfs' {
    ensure_packages( [ 'btrfs-tools', 'parted' ] )
  }
  else {
    ensure_packages( [ 'xfsprogs', 'parted' ] )
  }

  Package['ceph'] -> Ceph::Key <<| title == 'admin' |>>

}

