class ceph::apt::ceph (
) {

  include 'ceph::params'

  apt::key { 'ceph':
    key        => '17ED316D',
    key_source => 'https://ceph.com/git/?p=ceph.git;a=blob_plain;f=keys/release.asc',
  }

  apt::source { 'ceph':
    location => "http://ceph.com/debian-$::ceph::params::ceph_release/",
    release  => $::lsbdistcodename,
    require  => Apt::Key['ceph'],
    before   => Package['ceph'],
  }
}
