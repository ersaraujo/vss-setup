#!/bin/bash

xhost +local:docker
xhost +localhost
docker-compose up --quiet-pull  --build -d
