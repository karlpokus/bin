#!/bin/bash

# Install $BINARY at $DIR

BINARY=$1
DIR=/usr/local/bin

sudo install -o root -g root -m 0755 ${BINARY} ${DIR}

