#!/bin/bash
set -x

# This script will be copied on the Deployment server.

#First of all, we will add the Docker secrets on the deployment server:
       
docker pull devopsmolvi/webimages:${{github.run_number}}

docker run -it -d -p 8080:8080 --restart unless-stopped --name webserver devopsmolvi/webimages:${{github.run_number}}

