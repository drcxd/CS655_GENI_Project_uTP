#!/bin/bash

# Install packages
sudo apt update

# reinstall man-db
sudo apt remove man-db
sudo apt install man-db

sudo apt install aria2 transmission-daemon bittornado ctorrent git screen

# get wondershaper
cd ~
git clone https://github.com/magnific0/wondershaper.git

# configure aria2
mkdir ~/.aria2
echo "dir=~/downloads" >> ~/.aria2/aria2.conf
echo "seed-ratio=0.0" >> ~/.aria2/aria2.conf
echo "summary-interval=0" >> ~/.aria2/aria2.conf
echo "max-concurrent-downloads=10" >> ~/.aria2/aria2.conf
echo "min-split-size=5M" >> ~/.aria2/aria2.conf

# configure transmission
sudo echo "net.core.rmem_max = 4194304" >> /etc/sysctl.conf
sudo echo "net.core.wmem_max = 1048576" >> /etc/sysctl.conf
sudo sysctl -p

# Get the file we want to share
wget http://download.publicradio.org/podcast/minnesota/classical/programs/free-downloads/2016/10/24/daily_download_20161024_128.mp3
mv daily_download_20161024_128.mp3 Beethoven_Symphony_NO5_IV_Finale.mp3
