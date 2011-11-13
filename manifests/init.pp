class ree (
    $version   = $ree::params::version,
    $prefix    = $ree::params::prefix,
    $packages  = $ree::params::packages,
    $sourceuri = $ree::params::sourceuri
) inherits ree::params {

    package { 
        [ $packages ]: 
            ensure => present,
            before => Exec["${prefix}/bin/ree-version"],
    }

    exec {
        "${prefix}/bin/ree-version":
            command   => "curl -sS ${sourceuri}-${version}.tar.gz |tar -xzf - -C /tmp --no-same-owner && /tmp/ruby-enterprise-${version}/installer --auto ${prefix} && rm -rf /tmp/ruby-enterprise-${version}",
            creates   => "${prefix}/bin/ree-version",
            timeout   => 600,
            logoutput => on_failure,
    }
}
