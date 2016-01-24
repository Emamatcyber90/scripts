#!/bin/sh

NAME=$1
URL=$2

if [ ${NAME} ] && [ ${URL} ]; then
	cd /home/jay/repos
	git clone --recursive $URL
	cd $NAME
	git remote set-url origin http://that.pub:3080/$NAME
	git push -u origin master
else
	echo "Usage: repo <repo name> <repo URL>"
	exit 1;
fi

