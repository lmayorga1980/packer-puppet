class jrockit::redhat(
   $cfg  = $jrockit::params::cfg,
   $pkg  = $jrockit::params::pkg,
   $home = $jrockit::params::home
   ) inherits jrockit::params{

    file { ['/opt/oracle','/opt/oracle/java']:
      ensure => directory,
      owner  => 'oracle',
      group  => 'oinstall',
      mode   => '0774',
      before => Exec['install-jrockit']
    }

    file { $cfg:
      ensure  => present,
      name    => "/tmp/${cfg}",
      owner   => 'oracle',
      group   => 'oinstall',
      mode    => '0664',
      content => template('jrockit/silent.erb')
    }

    file { 'java.sh':
      ensure  => present,
      name    => '/etc/profile.d/java.sh',
      mode    => '0775',
      content => template('jrockit/set_java_home.erb')
    }

    file { $pkg:
      ensure => present,
      name   => "/tmp/${pkg}",
      source => "/vagrant_data/${pkg}",
      owner  => 'oracle',
      group  => 'oinstall',
      mode   => '0775'
    }

    exec {'install-jrockit':
      creates   => $home,
      command   => "/tmp/${pkg} -mode=silent -silent_xml=${cfg} -log=${pkg}.log",
      user      => 'oracle',
      cwd       => '/tmp',
      logoutput => true,
      require   => [File[$pkg],File[$cfg]]
    }
}
