#!/bin/bash

docker-compose -f docker-compose.yml -f docker-compose:live.yml up -d
docker volume prune