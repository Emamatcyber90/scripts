#!/bin/sh

NAME=$1
URL=$2

# I'm just gonna assume that $HOME is the home directory...

if [ $NAME ] && [ $URL ]; then
	if [ ! -s $HOME/repos ]; then
		mkdir -p $HOME/repos
	fi
	cd $HOME/repos
	git clone --recursive $URL
	cd $NAME
	NEW_REPO=$(src repo create $NAME)
	git remote set-url origin $NEW_REPO
	git push -u origin master
else
	echo "Usage: repo <repo name> <repo URL>"
	exit 1;
fi
echo "....................................."
echo "Repo cloned and added to Sourcegraph."
echo "---> Yay :)"
