#!/bin/bash

MURMURDIR=/home/eero/murmur/data

if [ -z "$MUMBLE_PASSWORD" ]; then
    echo "Error: MUMBLE_PASSWORD is not set. Exiting."
    exit 1
fi

if [ ! -d "$MURMURDIR" ]; then
    echo "Directory $MURMURDIR does not exist. Creating it..."
    mkdir -p "$MURMURDIR"
else
    echo "Directory $MURMURDIR already exists."
fi

docker run --detach \
           --name mumble-server \
           --publish 64738:64738/tcp \
           --publish 64738:64738/udp \
           --volume "$MURMURDIR:/data" \
	   -e "MUMBLE_CONFIG_SERVER_PASSWORD=${MUMBLE_PASSWORD}" \
           --restart on-failure \
           mumblevoip/mumble-server:latest
