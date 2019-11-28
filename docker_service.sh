#!/usr/bin/env bash

SERVICE_NAME=tabula
NETWORK=srvnetwork
NODE=bots
DOCKER_IMAGE=lexap/tabula

if [ "$(docker service ls -q -f name=${SERVICE_NAME})" ]; then
  docker service rm ${SERVICE_NAME}
fi

docker service create \
--name ${SERVICE_NAME} \
--network ${NETWORK} \
-p 9201:8080 \
--constraint "node.labels.srvname == ${NODE}" \
${DOCKER_IMAGE}
