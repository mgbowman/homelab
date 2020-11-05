#!/bin/bash -eu

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
CONFIG="$( cd "$( dirname "$1" )" >/dev/null 2>&1 && pwd )/$( basename "$1" )"
IMG_NAME="$( basename "${CONFIG}" )"

# > ./build.sh ./configs/ansible-lite

docker run --rm --privileged \
  -e IMG_NAME="${IMG_NAME}" \
	-e TARGET_HOSTNAME="pi" \
	-e TIMEZONE_DEFAULT="Europe/Amsterdam" \
	-e LOCALE_DEFAULT="en_US.UTF-8" \
	-e KEYBOARD_MAP="us" \
	-e KEYBOARD_LAYOUT="English (US)" \
	-e DEPLOY_ZIP=0 \
  -e $CONFIG \
  -v $DIR/stages:/pi-gen/stages:ro \
  -v $DIR/deploy:/pi-gen/deploy \
  mgbowman/pi-gen
