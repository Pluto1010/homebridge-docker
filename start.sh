#!/bin/sh
docker build -t homebridge .
# -p 0.0.0.0:5353:5353 \
# -p 0.0.0.0:39577:39577 \
# -p 0.0.0.0:45575:45575 \
# -p 0.0.0.0:51826:51826 \
# -p 0.0.0.0:61991:61991 \

docker run -d \
  --restart unless-stopped \
  --net=host -m 128M \
  homebridge
