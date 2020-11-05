# pi-gen

A collection of my custom builds of Raspbian OS using [mgbowman/pi-gen](https://github.com/mgbowman/pi-gen.git)

```
> git clone https://github.com/mgbowman/homelab
> cd homelab/rpi/pi-gen

# To enable ssh (see *_SSH env variables below)
> cp ~/.ssh/id_rsa.pub id_rsa.pub

# Build the 'ansible-lite' configuration
> build.sh ansible-lite

# roughly equates to ...

docker run --rm \
  -e TIMEZONE_DEFAULT="GMT"
  -e ENABLE_SSH=1                                     # SSH options enabled only if id_rsa.pub present
  -e PUBKEY_ONLY_SSH=1
  -e PUBKEY_SSH_FIRST_USER="$(cat $PWD/id_rsa.pub)"
  -v $PWD/ansible-lite:/config:ro \
  -v $PWD/stages:/stages:ro \
  -v $PWD/deploy:/deploy \
  mgbowman/pi-gen

# Baked images will be in deploy/
> ls -lah deploy/
  ..
```
