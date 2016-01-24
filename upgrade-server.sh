#!/bin/sh

sudo apt-get update
sudo apt-get upgrade -y --show-upgraded
sudo apt-get autoremove -y --purge
sudo apt-get autoclean
sudo apt-get clean
