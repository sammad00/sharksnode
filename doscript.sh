#!/bin/bash
set -x

# This script will be copied on the Deployment server.

#First of all, we will add the Docker secrets on the deployment server:

sed -i -e 's/"${{ secrets.DOCKER_USERNAME }}"/''/g' /home/users/frehman/input.txt
sed -i -e 's/"${{ secrets.DOCKER_PASSWORD }}"/''/g' /home/users/frehman/input.txt
