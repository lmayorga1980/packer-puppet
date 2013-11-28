import 'nodes'

#TODO:what about other host that do not require these users. (i.e puppet master)
  group { 'oinstall':
    ensure => 'present',
    gid    => 401,
  }

  group { 'dba':
    ensure => present,
    gid    => 400,
  }

  user { 'oracle':
    ensure      => present,
    uid         => 400,
    gid         => 401, # Primary Group Id
    name        => 'oracle',
    comment     => '"Oracle Owner"',
    home        => '/home/oracle',
    groups      => ['dba','admin'],
    managehome  => true,
    shell       => '/bin/bash',
    require     => Group['oinstall'],
  }

  package { 'glibc.i686':
    ensure => present
  }

  Exec {
    path => '/usr/bin:/bin:/usr/sbin:/sbin'
  }
