#!/bin/sh

TFTP_DIR=/var/tftpboot

IPXE_URL=https://github.com/ipxe/ipxe
IPXE_DIR=/ipxe
IPXE_TAG=v1.20.1

IPXE_ARCH=bin-x86_64-pcbios
IPXE_TARGET=undionly.kpxe

IPXE_CHAIN=chain.ipxe
IPXE_CHAIN_URL=${1:-"http://boot.ipxe.org/demo/boot.php"}

apk add --no-cache --virtual .deps git patch make gcc perl xz-dev musl-dev

git clone https://github.com/ipxe/ipxe $IPXE_DIR/git
cd $IPXE_DIR/git
git checkout tags/$IPXE_TAG -b $IPXE_TAG
cd $IPXE_DIR/git/src
patch -p1 < $IPXE_DIR/no-pie.patch
cat <<EOF > $TFTP_DIR/$IPXE_CHAIN
#!ipxe  
dhcp
chain $IPXE_CHAIN_URL
EOF
make $IPXE_ARCH/$IPXE_TARGET EMBED=$TFTP_DIR/$IPXE_CHAIN
mv $IPXE_ARCH/$IPXE_TARGET $TFTP_DIR

apk del .deps
