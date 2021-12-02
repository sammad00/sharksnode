#!/bin/bash
set -x

# This script will be copied on the Deployment server.

#First of all, we will add the Docker secrets on the deployment server:

ssh -i ~/.ssh/deploy.pem -oStrictHostKeyChecking=no frehman@54.91.22.158

scp -i ~/.ssh/deploy.pem -oStrictHostKeyChecking=no doscript.sh frehman@54.91.22.158:/home/users/frehman

ssh -i ~/.ssh/deploy.pem -oStrictHostKeyChecking=no frehman@54.91.22.158 "echo "${{ secrets.DOCKER_PASSWORD }}" | docker login -u "${{ secrets.DOCKER_USERNAME }}" --password-stdin"
       
docker pull frehman/pipe1:v.9.99

docker run -it -d -p 8066:80 --restart unless-stopped --name webserver frehman/pipe1:v.9.99
