# == Class:  weblogic::installer
#
# Installs Weblogic Middleware
#
# == Authors
#
# Ilver Anache <ilver.anache@gmail.com>
# Luis Mayorga <lmayorga1980@gmail.com>
#
class weblogic::install($cfg = $weblogic::params::cfg,
                        $pkg = $weblogic::params::pkg,
                        $mdw = $weblogic::params::mdw,
                        $jvm = $weblogic::params::jvm) inherits weblogic::params {

  file { 'config':
    ensure  => present,
    name    => "/tmp/$cfg",
    owner   => 'oracle',
    group   => 'oinstall',
    mode    => '0644',
    content => template('weblogic/weblogic-silent.xml.erb'),
  }

  file { 'installer':
    ensure => present,
    name   => "/tmp/${pkg}",
    owner  => 'oracle',
    group  => 'oinstall',
    mode   => '0755',
    source => "/vagrant_data/${pkg}"
  }

  exec {'install-weblogic':
    creates   => $mdw,
    command   => "java -Dspace.detection=false -jar ${pkg} -mode=silent -silent_xml=${cfg} -log=${pkg}.log",
    logoutput => true,
    timeout   => 1200,
    cwd       => '/tmp',
    user      => 'oracle',
    path      => "${jvm}/bin",
    require   => [File['config'],File['installer']],
  }
}
