#!/usr/bin/env bash

set -e

IMAGE="strangeducttape/metrix"

docker build -t ${IMAGE} .

docker push ${IMAGE}