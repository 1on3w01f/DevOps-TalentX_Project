

#DevOps

In this project, I have a product called TalentX. 
TalentX is a web Application where employers find and hire the best professional talents in the area of DevOps and 
Cybersecurity across the globe. The goal of this project is to showcase my expertise in the key areas of DevOps and Site Reliability Engineering (SRE).

TalentX is a business networking website written in Java. TalentX consists of multiple services - NGINX, APACHE TOMCAT, RABBITMQ, MEMCACHED, & MYSQL.
These services will form the website stack. The NGINX web service will be used as the load balancing in the application and will route users' requests to the APACHE TOMCAT server. The APACHE TOMCAT service is a java web application service that hosts the talentX application. It serves the user a web page to signup or login, and these login details are stored in the MYSQL database service. Also included in the stack is the MEMCACHED service, a database caching service that is connected to the MYSQL service in the stack. This will cache all the requests being returned by the MYSQL database service. Hence, next time the same request comes, it will be accessing the data which is cached in MEMCACHED. The RABBITMQ service is a queuing service to connect applications together in the stack.

 The website will be deployed and tested across the following platforms.
      
1. Local setup - Using vagrant to create VMs on a local Machine & deploying these services on the VMs using automation

2. Docker - the entire application set will be deployed and ran on docker containers

3. AWS Cloud - the entire project will be deployed and ran on the AWS cloud platform (PaaS & SaaS)

4. Kubernetes - the entire project will be deployed on Kubernetes Cluster



