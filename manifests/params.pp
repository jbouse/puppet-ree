class ree::params {
    $version   = '1.8.7-2011.03'
    $prefix    = '/usr/local'
    $sourceuri = 'http://rubyenterpriseedition.googlecode.com/files/ruby-enterprise'
    $packages  = $operatingsystem ? {
        /(?i-mx:ubuntu|debian)/        => ['libreadline5-dev', 'build-essential', 'libmysqlclient-dev'],
        # /(^i-mx:centos|fedora|redhat)/ => [''],
    }
}
