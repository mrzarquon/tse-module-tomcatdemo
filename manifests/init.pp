class tomcatdemo (
  $app_version = '1.0',
) {
  class { 'tomcat': }
  class { 'java': }

  tomcat::instance { 'tomcat8':
    catalina_base => '/opt/apache-tomcat/tomcat8',
    source_url    => 'https://s3-us-west-2.amazonaws.com/tseteam/files/apache-tomcat-8.0.26.tar.gz',
  }->
  tomcat::service { 'default':
    catalina_base => '/opt/apache-tomcat/tomcat8',
  }->
  tomcat::war { 'sample.war':
    catalina_base => '/opt/apache-tomcat/tomcat8',
    war_source => "https://s3-us-west-2.amazonaws.com/tseteam/files/sample-${app_version}.war",
  }

}
