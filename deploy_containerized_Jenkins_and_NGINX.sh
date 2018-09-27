#!/bin/nash

#########################################################################################################################
#																														#
#       Title:                 	deploy_containerized_Jenkins_and_NGINX.sh                                               #
#       Purpose:                Deploy containerized Jenkins and NGINX 				                                 	#
#       Author:                 Fabian Alexander Schyrer, Central Group                                               	#
#       Poasition:              General Manager, Cloud Engineering, CTO office                                        	#
#       Date created:           2018-09-27                                                                            	#
#                                                                                                                     	#
#########################################################################################################################

# Start Jenkins
echo "Starting Jenkins Docker Container..."
/var/lib/docker/git-repos/jenkins_docker_cto/pull.sh
/var/lib/docker/git-repos/jenkins_docker_cto/run.sh
echo

# Wait 120 Seconds
echo "Waiting 120 Seconds in order for Jenkins to start up. "
echo ""Waiting ...
sleep 120
echo

# Show initial Password
echo "Your initial Jenkins password is: "
docker exec jenkins-cto cat /var/jenkins_home/secrets/initialAdminPassword
echo 
echo "Please navigate to http://<Jenkins_URL>:8080 or https://cicd.central.tech"
echo

# Start NGINX
echo "Starting NGINX Docker Container..."
/var/lib/docker/git-repos/jenkins_docker_cto_nginx/pull.sh
/var/lib/docker/git-repos/jenkins_docker_cto_nginx/run.sh
echo 

# Docker Status
echo "Docker Networks: "
docker network list
echo

echo "Docker Jenkins Network: "
docker network inspect jenkins-network
echo

echo "Docker Images: "
docker image list
echo

echo "All Docker Containers: "
docker ps
echo

echo "All running Docker Containers: "
docker ps -a
echo 