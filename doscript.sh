#!/bin/bash
set -x

# This script will be copied on the Deployment server.

docker login --username ${{ secrets.DOCKER_USERNAME }} --password ${{ secrets.DOCKER_PASSWORD }}

docker pull frehman/pipe1:v.9.99

docker run -it -d -p 8099:80 --restart unless-stopped --name DO_web frehman/pipe1:v.9.99
