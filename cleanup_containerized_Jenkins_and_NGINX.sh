#!/bin/bash

#########################################################################################################################
#																														#
#       Title:                  cleanup_containerized_Jenkins_and_NGINX.sh                                              #
#       Purpose:                Cleanup containerized Jenkins and NGINX 				                                #
#       Author:                 Fabian Alexander Schyrer, Central Group                                               	#
#       Poasition:              General Manager, Cloud Engineering, CTO office                                        	#
#       Date created:           2018-09-27                                                                            	#
#                                                                                                                     	#
#########################################################################################################################

# Killing Docker Containers
echo 
echo "***** Killing running containers ..."
echo
docker kill jenkins-cto nginx-jenkins-cto

# Deleting Docker Containers
echo "***** Deleting containers ..."
echo
docker rm jenkins-cto nginx-jenkins-cto
echo

# Deleting Docker Network(s)
echo "***** Deleting Jenkins Network ..."
echo
docker network rm jenkins-network
echo

# Deleting Docker Volume(s)
echo "***** Deleting Jenkins Volumes ..."
echo
docker volume rm jenkins_home
echo

# Deleting Docker Images, ...
echo "***** Cleaning System ..."
echo
docker system prune -y
echo

# Docker Status
echo "***** Docker Networks: "
docker network list
echo

echo "***** Docker Jenkins Network: "
docker network inspect jenkins-network
echo

echo "***** Docker Images: "
docker image list
echo

echo "***** All Docker Containers: "
docker ps -a
echo

echo "***** Running Docker Containers: "
docker ps
echo 

echo "Cleanup successful"
echo