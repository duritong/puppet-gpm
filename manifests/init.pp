# modules/gpm/manifests/init.pp - manage gpm stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3

# modules_dir { "gpm": }

class gpm {
    case $operatingsystem {
        gentoo: { include gpm::gentoo }
        default: { include gpm::base }
    }

    case $selinux {
        include gpm::selinux
    }
}

class gpm::base {
    package{'gpm':
        ensure => installed,
    }

    service{gpm:
        ensure => running,
        enable => true,
        require => Package[gpm],
    }

}

class gpm::gentoo inherits gpm::base {
    Package[gpm]{
        category => 'sys-libs',
    }
}
