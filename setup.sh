#!/bin/bash

# Install rclone static binary
wget -q https://github.com/bnichs5/Better-Rclone-On-heroku/raw/master/rclone.zip
unzip -q rclone.zip
export PATH=$PWD:$PATH
chmod 777 /app/rclone

# Install aria2c static binary
wget -q https://github.com/bnichs5/Better-Rclone-On-heroku/raw/main/aria2-1.35.0-static-linux-amd64.tar.gz
tar xf aria2-1.35.0-static-linux-amd64.tar.gz
export PATH=$PWD:$PATH

# Create download folder
mkdir -p downloads

# DHT
wget -q https://github.com/bnichs5/DL-Rclone.conf/raw/master/dht.dat
wget -q https://github.com/bnichs5/DL-Rclone.conf/raw/master/dht6.dat

# Tracker
tracker_list=$(wget -qO- https://trackerslist.com/all.txt |awk NF|sed ":a;N;s/\n/,/g;ta")
echo "bt-tracker=$tracker_list" >> aria2c.conf

echo $PATH > PATH
