#!/bin/sh

# Thank you for this CWD script, @glenn-jackman
# http://stackoverflow.com/a/1820039/2780033
CWD=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

if [ ! -s $HOME/bin ]; then
    mkdir -p $HOME/bin
fi

BIN=$HOME/bin

chmod +x $CWD/*.sh

ln -s $CWD/firewall-update.sh $BIN/firewall
ln -s $CWD/node-swap.sh $BIN/nodeswap
ln -s $CWD/repo-grab-throw.sh $BIN/repo
ln -s $CWD/start-srcgraph.sh $BIN/srcstart
ln -s $CWD/upgrade-server.sh $BIN/upgrade

