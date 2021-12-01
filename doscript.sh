#!/bin/bash
set -x

# This script will be copied on the Deployment server.

#First of all, we will add the Docker secrets on the deployment server:

sed -i -e 's/DOCKER_USERNAME/'faisal'/g' /home/users/frehman/input.txt
#sed -i -e 's/DOCKER_PASSWORD/'"${{ secrets.DOCKER_PASSWORD }}"'/g' /home/users/frehman/input.txt
