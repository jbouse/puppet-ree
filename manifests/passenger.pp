class ree::passenger (
    $prefix         = $ree::params::prefix,
    $packages       = $ree::params::passenger_packages,
    $apache_confdir = $ree::params::apache_confdir
) inherits ree::params {

    package {
        [ $packages ]:
            ensure => present,
            before => Exec["${prefix}/bin/passenger-install-apache2-module"],
    }

    exec {
        "${prefix}/bin/passenger-install-apache2-module":
            command   => "${prefix}/bin/passenger-install-apache2-module -a",
            creates   => "$::passenger_root/ext/apache2/mod_passenger.so",
            require   => Exec["${prefix}/bin/ree-version"],
            logoutput => on_failure,
    }

    file {
        "${apache_confdir}/passenger.conf":
            ensure  => present,
            content => template("ree/passenger.conf"),
            mode    => '0644',
            owner   => 'root',
            group   => 'root',
    }
            
}
