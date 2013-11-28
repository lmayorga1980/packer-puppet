class weblogic::params{

  include jrockit::params
  $jvm = $jrockit::params::home

  $cfg     = 'weblogic-silent.xml'
  $pkg     = 'wls1036_generic.jar'
  $mdw     = '/opt/oracle/middleware_home'

  $domain        = 'soa_domain'
  $service       = 'soadomain'
  $admin_port    = 7001
  $password      = 'welcome1'
  $domains_home  = "${mdw}/user_projects/domains"
  $domain_home   = "${domains_home}/${domain}"
}
