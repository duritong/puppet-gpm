# manifests/disable.pp

class gpm::disable inherits gpm::base {
  # we can't remove the package, so we just disable the service
  Service[gpm]{
    ensure => stopped,
    enable => false,
  }
}
