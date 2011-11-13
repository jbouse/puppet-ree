class ree::params {
    $version   = '1.8.7-2011.03'
    $prefix    = '/usr/local'
    $sourceuri = 'http://rubyenterpriseedition.googlecode.com/files/ruby-enterprise'

    $apache_confdir = $::operatingsystem ? {
        /(?i-mx:ubuntu|debian)/        => "/etc/apache2/conf.d",
        /(^i-mx:centos|fedora|redhat)/ => "/etc/httpd/conf.d",
    }

    $packages  = $::operatingsystem ? {
        /(?i-mx:ubuntu|debian)/        => [
            'libreadline5-dev',
            'build-essential',
            'libmysqlclient-dev' ],
        # /(^i-mx:centos|fedora|redhat)/ => [''],
    }

    # TODO: Make operational for worker/threaded or prefork
    $passenger_packages = $::operatingsystem ? {
        /(?i-mx:ubuntu|debian)/        => [
            "libcurl4-openssl-dev",
            "apache2-mpm-prefork",
            "apache2-prefork-dev",
            "libapr1-dev",
            "libaprutil1-dev" ],
        # /(^i-mx:centos|fedora|redhat)/ => [''],
    }
}
