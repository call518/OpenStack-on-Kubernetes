#!/bin/bash

SECRET_NAME="keystone-fernet-keys"
TMP_DIR="tmp-keystone-fernet-keys"

key0="$TMP_DIR/0"
key1="$TMP_DIR/1"

#echo
#
#if kubectl get secret keystone-fernet-keys 2>/dev/null; then
#	echo
#	echo
#	read -p "**[WARNING]** Already keystone-fernet-keys is exist, overwrite? [y/n]: " reply
#	case "$reply" in
#		n|N)
#			echo
#			exit 0
#			;;
#		y|Y)
#			echo
#			kubectl delete secret $SECRET_NAME
#			;;
#		*)
#			echo
#			echo "Invalid Input"
#			echo
#			exit 1
#			;;
#	esac	
#fi
#
#
if [ ! -d $TMP_DIR ]; then
	mkdir -p $TMP_DIR
fi

python fernet-key-generator.py > $key0
python fernet-key-generator.py > $key1

if (kubectl get secret | grep -q "$SECRET_NAME"); then
	kubectl delete secret $SECRET_NAME
fi
kubectl create secret generic $SECRET_NAME --from-file=$key0 --from-file=$key1

echo

rm -rf $TMP_DIR 2>/dev/null
