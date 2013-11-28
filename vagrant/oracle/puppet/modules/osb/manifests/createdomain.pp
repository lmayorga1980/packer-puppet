# == Class:  osb::createdomain
#
# Configure an Oracle Service Bus Domain
#
# == Authors
#
# Ilver Anache <ilver.anache@gmail.com>
# Luis Mayorga <lmayorga1980@gmail.com>
class osb::createdomain inherits osb::params {

  file { 'create-domain':
    ensure  => present,
    name    => '/tmp/script_create_domain.py',
    content => template('osb/script_create_domain.erb'),
    owner   => 'oracle',
    mode    => '0755'
  }

  file { $osb_service:
    ensure  => present,
    name    => "/tmp/${osb_service}",
    content => template('osb/osb.erb'),
    mode    => '0755'
  }

  exec { 'create_osb_domain':
    command   => "sh ${mdw}/wlserver_10.3/common/bin/wlst.sh script_create_domain.py",
    path      => "/bin:/sbin:${jvm}/bin",
    cwd       => '/tmp',
    logoutput => true,
    require   => File['create-domain']
  }

  service { 'osb':
    ensure  => 'running',
    enable  => true,
    require => [File[$osb_service], Exec['create_osb_domain']]
  }
}
