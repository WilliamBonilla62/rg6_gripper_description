#!/bin/bash

IMAGE_NAME="ros_noetic"
CONTAINER_NAME="ros_noetic_container"
HOST_SRC_DIR=$(pwd)
DOCKER_WS_DIR="/ros_ws"

# Build the Docker image
echo "[*] Building Docker image: $IMAGE_NAME"
docker build -t $IMAGE_NAME .

# Run the Docker container with mounted volume
echo "[*] Running Docker container with $HOST_SRC_DIR mounted to $DOCKER_WS_DIR/src"
docker run -it --rm \
    --name $CONTAINER_NAME \
    -v "$HOST_SRC_DIR":"$DOCKER_WS_DIR/src/rg6_gripper_description" \
    -w "$DOCKER_WS_DIR" \
    $IMAGE_NAME
