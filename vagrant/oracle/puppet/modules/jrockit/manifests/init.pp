# == Class:  jrockit
#
# Installs Oracle Java SDK 
#
# == Authors
#
# Ilver Anache <ilver.anache@gmail.com>
# Luis Mayorga <lmayorga1980@gmail.com>
class jrockit{

  case $::osfamily {

    'RedHat'  : { include jrockit::redhat  }
    
    default  : { fail("Module ${module_name} is not supported on ${::osfamily}")}
  }
}
