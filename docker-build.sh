#!/bin/bash
USERNAME=prashantbhu
REPONAME=multi-arch-test
# Multi-arch images built with containerd(docker-container) as driver,
# Stay in the build cache after building
# So we need to:
# 1. Push them by adding the --push flag
# 2. Pull them if we need to see them on the local repo
docker buildx build --platform=linux/amd64,linux/arm64 -t ${USERNAME}/${REPONAME}:latest --push .

docker pull ${USERNAME}/${REPONAME}:latest
