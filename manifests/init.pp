class ree (
    $version  = $ree::params::version,
    $prefix   = $ree::params::prefix,
    $packages = $ree::params::depends
) inherits $ree::params {

    package { $packages: ensure => present }

    exec {
        "install Ruby Enterprise Edition":
            command => "curl -sS ${source}-${version}.tar.gz |tar -xzf - -C /tmp --no-same-owner && /tmp/ruby-enterprise-${version}/install --auto ${prefix} && rm -rf /tmp/ruby-enterprise-${version}",
            creates => "${prefix}/bin/ree-version",
    }
}
