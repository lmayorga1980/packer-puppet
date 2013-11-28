class osb::params {

  include weblogic::params
  include jrockit::params

  $mdw = $weblogic::params::mdw
  $jvm = $jrockit::params::path

  $osb_service = '/etc/init.d/osb'

}
