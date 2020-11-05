# pi-gen

A collection of my custom builds of Raspbian OS

```
> build.sh ansible-lite
> docker run --rm \
    -v $PWD/ansible-lite:/config:ro \
    -v $PWD/stages:/stages:ro \
    -v $PWD/deploy:/deploy \
    mgbowman/pi-gen

# should result in images in deploy/
> ls -lah deploy/
..
```
