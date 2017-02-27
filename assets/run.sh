#!/bin/sh
export PATH=/usr/local/lib/node_modules/homebridge-install/node_modules/.bin:$PATH

sed -i "s/rlimit-nproc=3/#rlimit-nproc=3/" /etc/avahi/avahi-daemon.conf
sed -i '/^use-ipv6=/s/=.*/=no/' /etc/avahi/avahi-daemon.conf
sed -i '/^enable-dbus=/s/=.*/=no/' /etc/avahi/avahi-daemon.conf

dbus-daemon --system
avahi-daemon --debug -D

DEBUG=* homebridge -D
