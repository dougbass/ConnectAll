#!/bin/bash
echo "Set the mule hostname in the ConnectAll.properties file"
sed -e "s/0.0.0.0\:8081/mule\:8081/g" </ConnectAll/mulesoft/mule-standalone-3.6.1/conf/ConnectAll.properties |
sed -e "s/0.0.0.0\:9080/mule\:9080/g" |
sed -e "s/0.0.0.0\:9090/mule\:9090/g" >/ConnectAll/mulesoft/mule-standalone-3.6.1/conf/z.z
mv /ConnectAll/mulesoft/mule-standalone-3.6.1/conf/z.z /ConnectAll/mulesoft/mule-standalone-3.6.1/conf/ConnectAll.properties

echo "Set the mule hostname in the MuleConfiguration.json file"
sed -e "s/localhost/mule/g" </ConnectAll/mulesoft/mule-standalone-3.6.1/database/ConnectAllApplication_MuleConfiguration.json >/ConnectAll/mulesoft/mule-standalone-3.6.1/database/z.z
mv /ConnectAll/mulesoft/mule-standalone-3.6.1/database/z.z /ConnectAll/mulesoft/mule-standalone-3.6.1/database/ConnectAllApplication_MuleConfiguration.json


#/etc/init.d/tomcat restart
