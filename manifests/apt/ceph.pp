class ceph::apt::ceph (
) {
  apt::key { 'ceph':
    key        => '17ED316D',
    key_source => 'https://ceph.com/git/?p=ceph.git;a=blob_plain;f=keys/release.asc',
  }

  apt::source { 'ceph':
    location => "http://ceph.com/debian-$::ceph::params::ceph_release/",
    release  => $::ceph::params::distro,
    require  => Apt::Key['ceph'],
    before   => Package['ceph'],
  }
}
