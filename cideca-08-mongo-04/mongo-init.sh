#!/bin/bash
mkdir -p /data/log/
touch /data/log/mongod.log
mongod --config /etc/mongod.conf