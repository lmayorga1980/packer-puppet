node 'weblogic-srv1'{
 # include jrockit
 # include weblogic
}

node 'osbhost1' {
  #$layer = 'producer'
	
  #stage { 'jdk': require => Stage['main'] }	
  #stage { 'wlsbase': require => Stage['jdk'] }
  #stage { 'weblogic_domain': require => Stage['wlsbase'] }
	
  #class { 
		
  #	'jrockit::install': 
  #			stage	=>	'jdk',
  #		# Configure some installation parameters
  #			architecture => "x64";
		
  #		'weblogic::installer':
  #			stage		=>	'wlsbase',
  #			mdw_home 	=> "${jrockit::install::ORACLE_HOME}/middleware",
  #		java_home 	=> "${jrockit::install::java_home}";
		
  #		'weblogic::configure':
  #			stage				=>	"weblogic_domain",
  #		java_home			=>	"${jrockit::install::java_home}",
  #			mdw_home 			=> 	"${jrockit::install::ORACLE_HOME}/middleware",
  #			domains_home		=> 	"${jrockit::install::ORACLE_HOME}/middleware/domains", 
  #			domain_name 		=> "OSBDomain", 
  #			service_name		=>	"osbdomain",
  #			admin_port 			=> "7001", 
  #			weblogic_password 	=> "welcome1", 
  #			domain_template 	=> "wls.jar";
  #}
}


