class tomcatdemo (
  $app_version = '1.0',
) {
  class { 'tomcat': }
  class { 'java': }

  tomcat::instance { 'tomcat8':
    catalina_base => '/opt/apache-tomcat/tomcat8',
    source_url    => 'http://mirror.nexcess.net/apache/tomcat/tomcat-8/v8.0.8/bin/apache-tomcat-8.0.8.tar.gz',
  }->
  tomcat::service { 'default':
    catalina_base => '/opt/apache-tomcat/tomcat8',
  }->
  tomcat::war { 'sample.war':
    catalina_base => '/opt/apache-tomcat/tomcat8',
    war_source => '/opt/apache-tomcat/tomcat8/webapps/docs/appdev/sample/sample.war',
  }

}
