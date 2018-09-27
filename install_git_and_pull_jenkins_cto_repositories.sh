#!/bin/bash

#########################################################################################################################
#																														#
#       Title:                  install_git_and_pull_jenkins_cto_repositories.sh                                        #
#       Purpose:                Install Git Client and pull repositories (Jenkins, NGINX and Deployment Scripts         #
#       Author:                 Fabian Alexander Schyrer, Central Group                                               	#
#       Poasition:              General Manager, Cloud Engineering, CTO office                                        	#
#       Date created:           2018-09-27                                                                            	#
#                                                                                                                     	#
#########################################################################################################################

echo

# Switch to User root
sudo su

# Update YUM
echo "***** Updating YUM..."
yum update -y
echo 

# Install Git Client
echo "***** Installing Git Client..."
yum install -y git
echo

# Clone required repositories
cd /var/lib/docker
echo "***** Creating Directory for Source Code Repository"
mkdir git-repos
cd git-repos
echo
echo "***** Cloning Jenkins Deployment Script Repository"
git clone https://github.com/fabianschyrer/jenkins_docker_cto_deployment_scripts.git
echo
echo "***** Cloning Jenkins Repository"
git clone https://github.com/fabianschyrer/jenkins_docker_cto
echo
echo "***** Cloning NGINX Repository"
git clone https://github.com/fabianschyrer/jenkins_docker_cto_nginx.git
echo 

# Start Deployment
# echo "***** Starting Deployment Script..."
# jenkins_docker_cto_deployment_scripts/deploy_containerized_Jenkins_and_NGINX.sh
# echo 