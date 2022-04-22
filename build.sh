#!/bin/bash

source .env

BUILD_DATE=$(date --utc '+%Y-%m-%dT%TZ');
echo $BUILD_DATE

docker build -t ${KEYCLOAK_IMAGE_NAME}:${KEYCLOAK_VERSION} \
  --build-arg KEYCLOAK_VERSION=${KEYCLOAK_VERSION} \
  --build-arg BUILD_DATE=${BUILD_DATE} \
  .

if [[ $? == 0 ]]; then
  echo built: ${KEYCLOAK_IMAGE_NAME}:${KEYCLOAK_VERSION}
else
  echo error
fi
