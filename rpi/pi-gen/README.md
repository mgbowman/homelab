# pi-gen

A collection of my custom builds of Raspbian OS using [mgbowman/pi-gen](https://github.com/mgbowman/pi-gen.git)

```
> git clone https://github.com/mgbowman/homelab.git
> cd homelab/rpi/pi-gen


# build.sh [-r <release>] [-i <id_rsa.pub>] ansible-lite

# Build the 'ansible-lite' configuration
> build.sh ansible-lite
> build.sh -r buster -i ~/.ssh/id_rsa.pub ansible-lite

# roughly equates to ...

docker run --rm \
  -e IMG_NAME="raspbian" \
  -e RELEASE="<release>" \
  -e TARGET_HOSTNAME="raspbian" \
  -e TIMEZONE_DEFAULT="GMT" \
  -e LOCALE_DEFAULT="en_US.UTF-8" \
  -e KEYBOARD_MAP="us" \
  -e KEYBOARD_LAYOUT="English (US)" \
  -e ENABLE_SSH=1 \
  -e PUBKEY_ONLY_SSH=1 \
  -e PUBKEY_SSH_FIRST_USER="<id_rsa.pub>" \
  -e DEPLOY_ZIP=0 \
  -v $PWD/ansible-lite:/config:ro \
  -v $PWD/stages:/stages:ro \
  -v $PWD/deploy:/deploy \
  mgbowman/pi-gen

# Baked images will be in deploy/
> ls -lah deploy/
  ..
```
