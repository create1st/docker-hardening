#!/bin/bash

set -uexo pipefail

for dockerfile in images/Dockerfile.*
do
	echo "Hardening: $dockerfile"
	DOCKER_BUILDKIT=0 docker build . -f "$dockerfile" --no-cache --tag "${dockerfile:18}-hardened"
done