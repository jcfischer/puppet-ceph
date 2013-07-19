class ceph::yum::ceph (
) {

  include 'ceph::params'

  yumrepo { 'ceph':
    descr    => "Ceph $::ceph::params::ceph_release repository",
    baseurl  => "http://ceph.com/rpm-$::ceph::params::ceph_release/el6/x86_64/",
    gpgkey   =>
      'https://ceph.com/git/?p=ceph.git;a=blob_plain;f=keys/release.asc',
    gpgcheck => 1,
    enabled  => 1,
    priority => 5,
    before   => Package['ceph'],
  }
}
