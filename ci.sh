#!/bin/bash

###################################################################
# Script Name : ci.sh
#
# Description :
#
# Args :  docker buildx build \
    #
# Creation Date : 28-11-2020
# Last Modified :
#
# Created By :
###################################################################
#!/bin/bash
# removed ppc64le temoporaryly as alpine repo is bad now

if [ "$TRAVIS_PULL_REQUEST" = "true" ] || [ "$TRAVIS_BRANCH" != "master" ]; then
    docker buildx build \
        --progress plain \
        --platform=linux/386,linux/amd64,linux/arm/v7,linux/arm/v6,linux/arm64,linux/s390x \
        .
    exit $?
fi
echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERID --password-stdin &> /dev/null
TAG="${TRAVIS_TAG:-latest}"
docker buildx build \
    --progress plain \
    --platform=linux/386,linux/amd64,linux/arm/v7,linux/arm/v6,linux/arm64,linux/s390x \
    -t $DOCKER_USERID/$DOCKER_REPO:$TAG \
    --push \
    .
