# maven-project

Simple Maven Project


Project -1 
https://www.youtube.com/watch?v=Z9G5stlXoyg&list=PLxzKY3wu0_FJdJd3IKdiM4Om1hGo2Hsdt&index=12 
Create two servers/EC2 machines
1.	Jenkins 
	Apt-get update or apt update
	install java – apt install openjdk-11-jdk –y
	install Git and maven – apt-get install –y git maven
install Jenkins
	download Jenkins files in Jenkins server(Jenkins EC2) from the url https://www.jenkins.io/download/ (wget url) then install Jenkins (java –jar jenkins.war)  
	connect to Jenkins first time using password given at the time of installing Jenkins or you can get it 

If there is no docker 
(cat /root/.jenkins/secrets/initialAdminPassword)

If jenkins is installed in docker container then, go into the shell of jenkins using “docker exec –it containerid bash” then 
cat /var/Jenkins_home/secrets/initialAdminPassword 

2.	Webserver – Tomcat Apache
	Apt-get update
	Install tomcat – apt-get install –y tomcat8
	apt-get install –y tomcat8-admin

If Jenkins wants to communicate with tomcat8 then tomcat8 must have a user so that Jenkins can communicate with that user.
Go to the file “tomcat-user.xml” in tomcat server
Cd /etc/tomcat8/ then ls then sudo vim tomcat-users.xml 
Add user there <user username="Aqeel" password="pwd123" roles="manager-script,manager-status,manager-gui"/>

3.	Now create a job in Jenkins , provide GIT url for downloading code from the repository, then  provide tomcat credentials in Jenkins under Jenkins->credentials->system->global credentials and if you have private repository (GIT) then need to add credentials of that as well like we did for tomcat credentials and also install plugin “Deploy to Container” 

For building job automatically use Poll SCM in build trigger or see the video link above if not able to do other things.

If you get any issues related to maven please go to Manage Jenkins->Global Tool Configuration->go down to the page and select maven version and name->save (or you can watch this video to get idea about it https://www.youtube.com/watch?v=V-VFrYF_Z1Y )
Now deploy war to the tomcat container, add credentials of tomcat and provide **/*.war and context path. 

And if you want to set up using periodically build or poll scm then need to install plug in “parameterized scheduler” and in poll scm cron values should be in format */2 * * * * if you want it build in every 2 mintues
Dockerfile is not important in this project , we can remove it if we want 




