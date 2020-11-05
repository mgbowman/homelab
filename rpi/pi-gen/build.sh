#!/bin/bash -eu

# docker run --rm \
#    -v $PWD/config:/config:ro \
#    -v $PWD/stages:/stages:ro \
#    -v $PWD/deploy:/deploy \
#    mgbowman/pi-gen

echo "usage: ./build.sh -c path/to/config -s path/to/stages/dir -d path/to/deploy/dir"
