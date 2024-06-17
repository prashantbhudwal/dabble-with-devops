#!/bin/bash
USERNAME=prashantbhu
REPONAME=multi-arch-test

docker buildx imagetools inspect ${USERNAME}/${REPONAME}:latest
