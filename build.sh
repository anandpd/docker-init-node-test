#!/bin/bash

## REMOVE OLD DOCKER CONTAINER
# -f forcfully shutdown running container
# v delete associated volumes
docker container rm -fv node-docker-container

## BUILD DOCKER IMAGE
docker build -t node-docker-im .

## CREATE A NEW CONTAINER AND RUN
# (pwd) : system variable for mac , current dir.
# -p : expose port local:container
# -v assigns volume (bind mount) to sync changes to container :ro = read only
# -v (2) is for node_modules, * do not modify /app/node_modules
# --name : container name
# image name
docker run -d -v $(pwd):/app:ro -v /app/node_modules -p 3000:3000 --name node-docker-container node-docker-im

## DELETE UNTAGGED IMAGES
docker image prune

## DELTE UNUSED VOLUMES
docker volume prune

## PRINT LOGS FROM THIS CONTAINER
docker logs node-docker-container