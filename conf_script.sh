#!/usr/bin/env bash
set -x

# changing conf taking the values from the env
TMPDIR=. sed -i -e "s/DIRECTOR_PASSWORD/$DIRECTOR_PASSWORD/g" /etc/bareos/bareos-fd.conf
TMPDIR=. sed -i -e "s/DIRECTOR_NAME/$DIRECTOR_NAME/g" /etc/bareos/bareos-fd.conf
TMPDIR=. sed -i -e "s/FD_NAME/$FD_NAME/g" /etc/bareos/bareos-fd.conf

# start bareos-fd
exec /usr/sbin/bareos-fd
