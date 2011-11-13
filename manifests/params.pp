class ree::params {
    $version = '1.8.7-2011.03'
    $prefix  = '/opt/local'

    $packages = $operatingsystem ? {
        /(?i-mx:ubuntu|debian)/        => ['libreadline5-dev', 'build-essential', 'libmysqlclient-dev'],
        /(^i-mx:centos|fedora|redhat)/ => [''],
    }
}
