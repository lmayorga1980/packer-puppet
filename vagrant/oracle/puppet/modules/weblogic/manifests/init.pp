# == Class:  weblogic
#
# Installs JDK
#
# == Authors
#
# Ilver Anache <ilver.anache@gmail.com>
#Luis Mayorga <lmayorga1980@gmail.com>
class weblogic {
  include weblogic::install, weblogic::configure

  Class['weblogic::install'] -> Class['weblogic::configure']
}

