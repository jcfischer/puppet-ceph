# these parameters need to be accessed from several locations and
# should be considered to be constant
class ceph::params {

  # Ceph Release Parameter
  # Allowed: argonaut, bobtail, cuttlefish
  $ceph_release = 'cuttlefish'

  # File System Type Parameter
  # Allowed: xfs (recommended for Production), btrfs (only for Testing)
  $fs_type = 'btrfs'

  # Linux Distro Parameter
  #
  $distro = 'raring'

  case $::osfamily {
    'Debian': {
      case $::operatingsystem {
        'Ubuntu': {
          $service_provider = 'init'
        }
        default: {
          $service_provider = undef
        }
      }
    }
  }
}
