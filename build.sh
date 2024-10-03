#!/bin/bash


KEYCLOAK_IMAGE_NAME=devbfvio/keycloak

if [ -z "$1" ]; then
  echo "Usage: $0 <keycloak_version>"
  exit 1
fi

KEYCLOAK_VERSION=$1
FULLIMAGENAME=${KEYCLOAK_IMAGE_NAME}:${KEYCLOAK_VERSION}-postgres
BUILD_DATE=$(date --utc '+%Y-%m-%dT%TZ');

echo "Building image: ${FULLIMAGENAME} @ ${BUILD_DATE}"

docker build -t ${FULLIMAGENAME} \
  --build-arg KEYCLOAK_VERSION=${KEYCLOAK_VERSION} \
  --build-arg BUILD_DATE=${BUILD_DATE} \
  --no-cache \
  .

if [[ $? == 0 ]]; then
  echo "built: ${FULLIMAGENAME}"
  echo "docker push ${FULLIMAGENAME}"
else
  echo error
fi
