#!/bin/sh

sudo apt-get update
sudo apt-get install ruby -y

# From: http://sass-lang.com/install
sudo su -c "gem install sass"
