#!/bin/bash
date
export JAVA_HOME=/usr/local/bin/java1.7/jdk1.7.0_79
export PATH=$JAVA_HOME/bin:$PATH
echo "Change to the /ConnectAll folder"
cd /ConnectAll
echo "Make all the script executable"
chmod +x $1
chkconfig --add mule.sh
echo "Execute the installer $1 with the varfile $2"
$1 -varfile $2 -q  -console   -Dinstall4j.keepLog=true   -Dinstall4j.logToStderr=true
$3
$4
