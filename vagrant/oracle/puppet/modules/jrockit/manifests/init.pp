# == Class:  jrockit
#
# Installs JDK
#
# == Authors
#
# Ilver Anache <ilver.anache@gmail.com>
# Luis Mayorga <lmayorga1980@gmail.com>
class jrockit{

  case $::osfamily {

    'RedHat' : { include jrockit::redhat  }
    'Windows': { include jrockit::windows }
    default  : { fail("Module ${module_name} is not supported on ${::osfamily}")}
  }
}
