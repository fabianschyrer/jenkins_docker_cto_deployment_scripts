#!/bin/bash

#########################################################################################################################
#																														#
#       Title:                 	deploy_containerized_Jenkins_and_NGINX.sh                                               #
#       Purpose:                Deploy containerized Jenkins and NGINX 				                                 	#
#       Author:                 Fabian Alexander Schyrer, Central Group                                               	#
#       Poasition:              General Manager, Cloud Engineering, CTO office                                        	#
#       Date created:           2018-09-27                                                                            	#
#                                                                                                                     	#
#########################################################################################################################

echo 

# Start Jenkins
echo "***** Starting Jenkins Docker Container..."
echo
/var/lib/docker/git-repos/jenkins_docker_cto/pull.sh
echo
/var/lib/docker/git-repos/jenkins_docker_cto/run.sh
echo

# Wait 180 Seconds
echo "***** Waiting 180 Seconds in order for Jenkins to start up. "
echo "***** Waiting ..."
sleep 180
echo

# Show initial Password
echo "***** Your initial Jenkins password is: "
echo
docker exec jenkins-cto cat /var/jenkins_home/secrets/initialAdminPassword
echo 
echo "***** Please navigate to "
echo "      http://<Jenkins_URL>:8080      or "
echo "      https://cicd.central.tech"
echo

# Start NGINX
echo "***** Starting NGINX Docker Container..."
echo
/var/lib/docker/git-repos/jenkins_docker_cto_nginx/pull.sh
echo 
/var/lib/docker/git-repos/jenkins_docker_cto_nginx/run.sh
echo 

# Docker Status
echo "***** Docker Networks: "
echo
docker network list
echo

echo "***** Docker Jenkins Network: "
echo
docker network inspect jenkins-network
echo

echo "***** Docker Images: "
echo
docker image list
echo

echo "***** All Docker Containers: "
echo
docker ps -a
echo

echo "***** Running Docker Containers: "
echo
docker ps
echo 