# manifests/selinux.pp

class gpm::selinux {
    case $operatingsystem {
        gentoo: { include gpm::selinux::gentoo }
        default: { info("No selinux stuff yet defined for your operatingsystem") }
    }
}

class gpm::selinux::gentoo {
    package{'selinux-gpm':
        ensure => present,
        category => 'sec-policy',
        require => Package[gpm],
    }
    selinux::loadmodule {"gpm": require => Package[selinux-gpm] }
}

