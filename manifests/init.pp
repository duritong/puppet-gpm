# modules/gpm/manifests/init.pp - manage gpm stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3

class gpm {
  case $virtual {
    'physical','xen0': {    
      case $operatingsystem {
        gentoo: { include gpm::gentoo }
        default: { include gpm::base }
      }
    }
    # gpm makes only sense on physical or xen0 hosts
    default: { include gpm::disable }
  }
}
