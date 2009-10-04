# modules/gpm/manifests/init.pp - manage gpm stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3

# modules_dir { "gpm": }

class gpm {
    case $virtual {
        'physical': {    
            case $operatingsystem {
                gentoo: { include gpm::gentoo }
                default: { include gpm::base }
            }
        }
        # gpm makes only sense on physical hosts
        default: { include gpm::disable }
    }
}
