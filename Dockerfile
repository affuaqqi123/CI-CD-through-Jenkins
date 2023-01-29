# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "Aqeel Mohammed" 
COPY ./webapp.war /usr/local/tomcat/webapps
