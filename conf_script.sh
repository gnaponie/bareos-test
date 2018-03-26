#!/usr/bin/env bash

# changing conf taking the values from the env
TMPDIR=. sed -i -e "s/DIRECTOR_PASSWORD/$DIRECTOR_PASSWORD/g" /etc/bareos/bareos-fd.conf
TMPDIR=. sed -i -e "s/DIRECTOR_NAME/$DIRECTOR_NAME/g" /etc/bareos/bareos-fd.conf
TMPDIR=. sed -i -e "s/FD_NAME/$FD_NAME/g" /etc/bareos/bareos-fd.conf

# start bareos-fd
touch /var/lib/bareos/bareos-fd.9102.pid
chmod 777 /var/lib/bareos/bareos-fd.9102.pid
bareos-fd -f
