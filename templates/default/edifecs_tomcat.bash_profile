JAVA_HOME=/usr/lib/jvm/jdk1.8.0_131; export JAVA_HOME
CATALINA_HOME=/opt/tomcat/tomcat01; export CATALINA_HOME
CATALINA_OPTS="-Xms512M -Xmx1024M -XX:MaxPermSize=256M -d64"; export CATALINA_OPTS
PATH=$PATH:$HOME/bin:$JAVA_HOME/bin:$CATALINA_HOME/bin; export PATH
