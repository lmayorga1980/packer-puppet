# == Class:  weblogic::configure
#
# Configure a Weblogic Middleware Domain
#
# == Authors
#
# Ilver Anache <ilver.anache@gmail.com>
# Luis Mayorga <lmayorga1980@gmail.com>
class weblogic::configure inherits weblogic::params {

  file {'domain-script':
    ensure  => present,
    name    => '/tmp/create_domain.py',
    content => template('weblogic/create_domain.erb'),
    mode    => '0755'
  }

  file { [  "${weblogic::params::mdw}/wlserver_10.3/common/bin/commEnv.sh",
            "${weblogic::params::mdw}/wlserver_10.3/common/bin/wlst.sh"]:
    ensure => present,
    mode   => '0775',
    owner  => 'oracle',
    group  => 'oinstall',
    before => Exec['create-weblogic-domain']
  }

  exec {'create-weblogic-domain':
    creates   => $weblogic::params::domain_home,
    command   => 'commEnv.sh && wlst.sh /tmp/create_domain.py',
    path      => ["${weblogic::params::mdw}/wlserver_10.3/common/bin",'/usr/bin','/bin'],
    user      => 'oracle',
    logoutput => true,
    require   => File['domain-script'],
    timeout   => 600
  }

  file { 'service-script':
    ensure  => present,
    name    => "/etc/init.d/${weblogic::params::service}",
    mode    => '0751',
    owner   => 'root',
    group   => 'root',
    content => template('weblogic/domain_service_startup.erb')
  }

  exec {'add-service':
    command   => "chkconfig --add ${weblogic::params::service}",
    cwd       => '/etc/rc.d/init.d',
    logoutput => true,
    require   => File[service-script]
  }

  service { $weblogic::params::service:
    ensure  =>  'running',
    enable  =>  true,
    require =>  [Exec['add-service'], Exec['create-weblogic-domain']]
  }
}
