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
echo "Change to the /ConnectAll folder"
cd /ConnectAll
echo "Make all the script executable"
chmod +x $1
chkconfig --add tomcat
echo "Execute the installer $1 with the varfile $2"
$1 -varfile $2 -q  -console   -Dinstall4j.keepLog=true   -Dinstall4j.logToStderr=true
$3
$4
