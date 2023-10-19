#!/bin/bash

# Prompt user for image name and tag
read -p "Enter image name: " IMAGE_NAME
read -p "Enter image tag: " IMAGE_TAG

# Build DockerfileArm64 using buildx
docker buildx build --platform linux/arm64 -f DockerfileArm64 -t $IMAGE_NAME:$IMAGE_TAG-arm64 .

# Build Dockerfilex86
docker build -f Dockerfilex86 -t $IMAGE_NAME:$IMAGE_TAG-x86 .

# Push Docker images to Docker Hub
docker push $IMAGE_NAME:$IMAGE_TAG-arm64
docker push $IMAGE_NAME:$IMAGE_TAG-x86

echo "Build and push complete!"
