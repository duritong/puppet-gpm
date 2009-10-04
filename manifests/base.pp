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
