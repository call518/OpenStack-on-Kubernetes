#!/bin/bash

if [ $# -eq 0 ]; then
	echo "needed Image Tag, retry~~~"
	exit
fi

LPATH=`pwd`
NAME1="call518/`basename $LPATH`:$1"
NAME2="call518/`basename $LPATH`:latest"

docker build -t $NAME1 . && docker push $NAME1
docker tag $NAME1 $NAME2 && docker push $NAME2
