#!/bin/bash

echo "Starting apache2..."
/etc/init.d/apache2 restart

set -e

#TODO:Not sure if gerrit can be stopped properly...
echo "Starting Gerrit..."
exec gosu ${GERRIT_USER} $GERRIT_SITE/bin/gerrit.sh daemon
