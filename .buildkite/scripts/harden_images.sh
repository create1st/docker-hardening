#!/bin/bash

set -uexo pipefail

for dockerfile in images/Dockerfile.*
do
	echo "Hardening: $dockerfile"
	docker build . -f "$dockerfile" --tag "${dockerfile:18}-hardened"
done