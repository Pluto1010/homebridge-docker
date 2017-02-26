#!/bin/sh
docker build -t homebridge .
docker run -d --restart yes --net=host -m 128M -p 0.0.0.0:51826:51826 -p 0.0.0.0:5353:5353 homebridge
