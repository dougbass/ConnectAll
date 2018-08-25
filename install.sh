#!/bin/bash
date
echo Sleeping while mounts are created
while ! [ -f /ConnectAll/mulesoft/mule-standalone-3.6.1/logs/mule.log ];
do
    echo "Waiting for mule to finish installation"
    sleep 10
done
sleep 2
date
export JAVA_HOME=/usr/local/bin/java1.7/jdk1.7.0_79
export PATH=$JAVA_HOME/bin:$PATH
export CATALINA_HOME=/ConnectAll/CATomcat
echo "Change to the /ConnectAll folder"
cd /ConnectAll

# Run the upgrade if the file exists
if [ -f /ConnectAll/mulesoft/upgrade.sh ]; then
  echo "Run the ConnectAll upgrade"
  cd /ConnectAll
  echo "Make all the script executable"
  chmod +x $1
  chkconfig --add tomcat
  echo "Run the upgrade script"
  /ConnectAll/mulesoft/upgrade.sh -varfile /ConnectAll/connectall_ui.varfile -q  -console   -Dinstall4j.keepLog=true   -Dinstall4j.logToStderr=true 
  sleep 60
  $CATALINA_HOME/bin/shutdown.sh
else
# Do this once on a new install
  if [ ! -f $CATALINA_HOME/logs/ConnectAll.log ]; then
    echo "Change to the /ConnectAll folder"
    cd /ConnectAll
    echo "Make all the script executable"
    chmod +x $1
    chkconfig --add tomcat
    echo "Execute the installer"
    /ConnectAll/ConnectAll.sh -varfile /ConnectAll/connectall_ui.varfile -q  -console   -Dinstall4j.keepLog=true   -Dinstall4j.logToStderr=true 
    sleep 60
    /ConnectAll/set_mule_hostname.sh
    $CATALINA_HOME/bin/shutdown.sh
  fi
fi

# Do this everytime the container starts
echo "Startup tomcat in the shell" 
$CATALINA_HOME/bin/catalina.sh run
#service tomcat start
#tail -f $CATALINA_HOME/logs/catalina.out