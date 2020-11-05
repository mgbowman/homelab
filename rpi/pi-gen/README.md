# pi-gen

A collection of my custom builds of Raspbian OS using [mgbowman/pi-gen](https://github.com/mgbowman/pi-gen.git)

```
~
> git clone https://github.com/mgbowman/homelab

~ 
> cd homelab/rpi/pi-gen

homelab/rpi/pi-gen
> cp ~/.ssh/id_rsa.pub id_rsa.pub
> build.sh ansible-lite

# roughly equates to...
# docker run --rm \
#   -e PUBKEY_ONLY_SSH=1
#   -e PUBKEY_SSH_FIRST_USER="$(cat $PWD/id_rsa.pub)"
#   -v $PWD/ansible-lite:/config:ro \
#   -v $PWD/stages:/stages:ro \
#   -v $PWD/deploy:/deploy \
#   mgbowman/pi-gen

# should result in images in deploy/
> ls -lah deploy/
  ..
```
