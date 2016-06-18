#!/bin/sh

cd $HOME
curl -O -L https://sourcegraph.com/.download/latest/linux-amd64/src.gz
gunzip src.gz
chmod +x src
if [ ! -s $HOME/bin ]; then
    mkdir -p $HOME/bin
fi
cp src $HOME/bin
src serve
