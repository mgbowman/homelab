#!/bin/bash -eu

docker run --rm --privileged \
  -e IMG_NAME="$(basename $1)" \
  -e $PWD/defaults \
  -e $PWD/$1 \
  -v $PWD/$1:/pi-gen/config:ro \
  -v $PWD/stages:/pi-gen/stages:ro \
  -v $PWD/deploy:/pi-gen/deploy \
  mgbowman/pi-gen
