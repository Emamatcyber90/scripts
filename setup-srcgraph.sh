#!/bin/sh

cd ~
curl -O -L https://sourcegraph.com/.download/latest/linux-amd64/src.gz
gunzip src.gz
chmod +x src
cp src ~/bin
./src serve
