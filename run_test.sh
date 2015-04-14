#!/bin/sh

DYNAMODB_IMAGE=quay.io/viadeo/docker-dynamodb-local
DYNAMODB_NAME=dynamodb
TEST_IMAGE=dynamodb-python-tester

# Build images
echo "Building $DYNAMODB_IMAGE"
docker build -t $DYNAMODB_IMAGE .
echo "Building $TEST_IMAGE"
docker build -t $TEST_IMAGE test

# Run main container
docker kill $DYNAMODB_NAME
docker run --rm --name=$DYNAMODB_NAME $DYNAMODB_IMAGE -inMemory &
sleep 1

# Run tester container
docker run --rm --link=$DYNAMODB_NAME:$DYNAMODB_NAME $TEST_IMAGE

# Stop main container
docker stop $DYNAMODB_NAME
