#!/bin/bash

source .env

docker build -t ${KEYCLOAK_IMAGE_NAME}:${KEYCLOAK_VERSION} --build-arg KEYCLOAK_VERSION=${KEYCLOAK_VERSION} .
if [[ $? == 0 ]]; then
  echo built: ${KEYCLOAK_IMAGE_NAME}:${KEYCLOAK_VERSION}
else
  echo error
fi
