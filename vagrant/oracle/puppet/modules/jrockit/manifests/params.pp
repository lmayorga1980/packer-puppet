class jrockit::params{

  $cfg  = 'jrockit-silent.xml'

  $pkg = $::osfamily ? {
    /(?i-mx:windows)/ => 'jrockit-jdk1.6.0_45-R28.2.7-4.1.0-64.exe',
    /(?i-mx:redhat)/  => 'jrockit-jdk1.6.0_45-R28.2.7-4.1.0-64.bin'
  }

  $home = $::osfamily ? {
    /(?i-mx:windows)/ => 'C:\Program Files (x86)\JRockit',
    /(?i-mx:redhat)/  => "/opt/oracle/java/${pkg}"
  }
}
