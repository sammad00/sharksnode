#!/bin/bash
set -e

ssh -i ~/.ssh/deploy.pem -oStrictHostKeyChecking=no frehman@52.55.48.5

export DOCKER_USERNAME 
export DOCKER_PASSWORD 

docker pull frehman/pipe1:v.1.1
