#!/bin/bash

LPATH=`pwd`
NAME="call518/`basename $LPATH`"

docker build -t $NAME . && docker push $NAME
