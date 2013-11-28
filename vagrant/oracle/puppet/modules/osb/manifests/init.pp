# == Class:  osb
#
# Configure an Oracle Service Bus Domain
#
# == Authors
#
# Ilver Anache <ilver.anache@gmail.com>
# Luis Mayorga <lmayorga1980@gmail.com>
class osb ($layer = "osb") inherits osb::params {

  $inventory_loc = "${mdw}/wlserver_10.3/inventory"

  file { 'response':
    ensure  => present,
    name    => '/tmp/response.rsp',
    content => template('osb/response.erb'),
  }

  file { 'osb-installer':
    ensure  =>  present,
    name    => '/tmp/osbinstaller',
    source  => '/vagrant_data/osbinstaller',
    recurse => true,
    user    => 'oracle'
  }

  file { 'orainst':
    ensure  => present,
    name    => '/tmp/orainst.loc',
    content => template('osb/oraInst.erb'),
  }

 # exec { 'installing_osb':
 #   command => "/vagrant_data/osb/Disk1/runInstaller -silent -jreLoc ${jvm} -invPtrLoc oraInst.loc -responseFile response.rsp",
 #   path    => '/usr/bin:/usr/sbin:/bin:/sbin',
 #   cwd     => '/tmp',
 #   timeout => 0,
 #   require => [File['response'], File['orainst']]
 # }
}
