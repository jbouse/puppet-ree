class ree (
    $version   = $ree::params::version,
    $prefix    = $ree::params::prefix,
    $packages  = $ree::params::depends,
    $sourceuri = $ree::params::source
) inherits ree::params {

    package { 
        $packages: 
            ensure => present,
            before => Exec["install Ruby Enterprise Edition"],
    }

    exec {
        "install Ruby Enterprise Edition":
            command => "curl -sS ${sourceuri}-${version}.tar.gz |tar -xzf - -C /tmp --no-same-owner && /tmp/ruby-enterprise-${version}/install --auto ${prefix} && rm -rf /tmp/ruby-enterprise-${version}",
            creates => "${prefix}/bin/ree-version",
    }
}
