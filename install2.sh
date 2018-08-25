#!/bin/bash

echo "Startup time is `date`"
export JAVA_HOME=/usr/local/bin/java1.7/jdk1.7.0_79
export MULE_HOME=/ConnectAll/mulesoft/mule-standalone-3.6.1
export CONNECTALL_HOME=$MULE_HOME/database
export PATH=$MULE_HOME/bin:$JAVA_HOME/bin:$PATH

trap "service mule.sh stop" SIGINT SIGTERM

# Run the upgrade if the file exists
if [ -f /ConnectAll/mulesoft/upgrade.sh ]; then
  echo "Run the ConnectAll upgrade"
  cd /ConnectAll
  echo "Make all the script executable"
  chmod +x $1
  chkconfig --add mule.sh
  echo "Execute the installer $1 with the varfile $2"
  /ConnectAll/mulesoft/upgrade.sh -varfile /ConnectAll/connectall_mule.varfile -q  -console   -Dinstall4j.keepLog=true   -Dinstall4j.logToStderr=true 
  service mule.sh stop
else
# Do this once on a new install
  if [ ! -f $MULE_HOME/logs/mule.log ]; then
    echo "Change to the /ConnectAll folder"
    cd /ConnectAll
    echo "Make all the script executable"
    chmod +x $1
    chkconfig --add mule.sh
    echo "Execute the installer $1 with the varfile $2"
    /ConnectAll/ConnectAll.sh -varfile /ConnectAll/connectall_mule.varfile -q  -console   -Dinstall4j.keepLog=true   -Dinstall4j.logToStderr=true 
    service mule.sh stop
  fi
fi

# Do this everytime the container starts
/ConnectAll/shutdown_tomcat.sh
mule
#tail -f $MULE_HOME/logs/mule.log
