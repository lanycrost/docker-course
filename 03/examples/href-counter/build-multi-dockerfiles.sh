#!/bin/sh
echo Building href-counter:sdk

docker build -t href-counter:sdk . -f Dockerfile.build

docker create --name extract href-counter:sdk 
docker cp extract:/go/src/github.com/alexellis/href-counter/app ./app
docker rm -f extract

echo Building href-counter:builder

docker build --no-cache -t href-counter:builder .
