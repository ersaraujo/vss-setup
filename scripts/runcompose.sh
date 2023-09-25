#!/bin/bash

xhost +local:docker
docker-compose up --quiet-pull  --build -d
