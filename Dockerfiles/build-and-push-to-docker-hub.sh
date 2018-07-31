#!/bin/bash

if [ $# -eq 0 ]; then
	echo "needed Image Tag, retry~~~"
	exit
fi

LPATH=`pwd`
NAME="call518/`basename $LPATH`:$1"

docker build -t $NAME . && docker push $NAME
