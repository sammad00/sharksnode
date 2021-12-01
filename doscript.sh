#!/bin/bash
set -x

# This script will be copied on the Deployment server.

#First of all, we will add the Docker secrets on the deployment server:


sed -i -e 's/DOCKER_USERNAME/'"{{ secrets.DOCKER_USERNAME }}"'/g' /home/users/frehman/.docker/config.json
sed -i -e 's/DOCKER_PASSWORD/'"{{ secrets.DOCKER_PASSWORD }}"'/g' /home/users/frehman/.docker/config.json

docker login --username {{ secrets.DOCKER_USERNAME }} --password {{ secrets.DOCKER_PASSWORD }}

docker pull frehman/pipe1:v.9.99

docker run -it -d -p 8099:80 --restart unless-stopped --name DO_web frehman/pipe1:v.9.99
