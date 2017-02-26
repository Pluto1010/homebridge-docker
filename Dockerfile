FROM node:6.10

# Ensure UTF-8
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

# RUN apk update && \
#  apk add build-base python avahi avahi-dev && \
#  sed -i 's/#enable-dbus=yes/enable-dbus=no/g' /etc/avahi/avahi-daemon.conf && \
#  rm -rf /var/cache/apk/*

RUN apt-get update -y \
  && apt-get -qq install -y libavahi-compat-libdnssd-dev libkrb5-dev net-tools \
  && apt-get -qq -y autoclean \
  && apt-get -qq -y autoremove \
  && apt-get -qq -y clean

USER root

RUN mkdir -p /var/run/dbus
VOLUME /var/run/dbus

RUN mkdir /homebridge
WORKDIR /homebridge

EXPOSE 5353 51826

COPY /package.json /homebridge/
RUN npm install -g

COPY run.sh /
RUN chmod u+x /run.sh
CMD ["/run.sh"]

RUN mkdir /root/.homebridge
VOLUME /root/.homebridge
COPY config.json /root/.homebridge/
