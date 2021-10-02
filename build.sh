#!/bin/bash
VERSION=14
IMAGE=felipeschirmann/node
echo "what enviroment? (prod or dev):"
read enviroment;
echo "latest version is:"
docker image ls | egrep "REPOSITORY" ; docker image ls | egrep $IMAGE
echo "what is new version?:"
read tag

if [[ "$enviroment" == "prod" && ! -z $tag  ]];
 then
  cp Dockerfile-prod Dockerfile
  docker build  --build-arg VER=$VERSION-slim  . -t felipeschirmann/node:prod-$tag --no-cache=true
  rm Dockerfile
fi

if [[ "$enviroment" == "dev" && ! -z $tag  ]];
then
  cp Dockerfile-dev Dockerfile
  docker build --build-arg VER=$VERSION . -t felipeschirmann/node:dev-$tag --no-cache=true
  rm Dockerfile
fi