#!/bin/sh

set -e

sed -i "s|driver=rtlsdr|driver=rtlsdr,serial=$RECEIVER_SERIAL|g" /etc/default/dump978-fa
sed -i "s|RECEIVER_PPM|$RECEIVER_PPM|g" /etc/supervisor/conf.d/supervisord.conf
sed -i "s|RECEIVER_LON|$RECEIVER_LON|g" /etc/supervisor/conf.d/supervisord.conf
sed -i "s|RECEIVER_LAT|$RECEIVER_LAT|g" /etc/supervisor/conf.d/supervisord.conf

mkdir -p '/run/skyaware978'
mkdir -p '/var/log/supervisor'
mkdir -p '/var/log/lighttpd'
chown -R www-data:www-data /var/log/lighttpd

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf