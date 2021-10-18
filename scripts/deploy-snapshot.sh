#!/bin/bash


# Define Tomcat's variables
APACHE_HOME=/opt/tomcat
APACHE_BIN=$APACHE_HOME/bin
APACHE_WEBAPPS=$APACHE_HOME/webapps

# Define product's variables
PRODUCT_SNAPSHOT_NAME=engineering.product-0.0.1-SNAPSHOT.war
RESOURCE_NAME=engineering.war

# Give permission to enter tomcat folder
sudo chmod 777 -R /opt/tomcat


# Shutdown Tomcat
sh $APACHE_BIN/shutdown.sh


# Deploy generated SNAPSHOT into the dev-env  
cp /vagrant_target/$PRODUCT_SNAPSHOT_NAME $APACHE_WEBAPPS
cd $APACHE_WEBAPPS

#mkdir $RESOURCE_NAME
#cp $PRODUCT_SNAPSHOT_NAME $RESOURCE_NAME
mv $PRODUCT_SNAPSHOT_NAME $RESOURCE_NAME
chown tomcat:tomcat $RESOURCE_NAME
#rm $PRODUCT_SNAPSHOT_NAME
#cd $RESOURCE_NAME
#sudo jar -xvf $PRODUCT_SNAPSHOT_NAME.war

# Start up Tomcat
sh $APACHE_BIN/startup.sh