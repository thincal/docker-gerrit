#!/bin/sh

echo

if [ "$1" = "" ]; then
  echo "Add a new user:  gerrit-user -a user passwd"
  echo "Delete a user:   gerrit-user -d user"
  echo "Update password: gerrit-user -u user passwd"
  echo "List users:      gerrit-user -l"
else
  PASSWDFILE="/home/liusong/gerrit_volume/etc/private/gerrit.passwords"
  echo "password file locates at: $PASSWDFILE"
  sudo touch $PASSWDFILE
  case "$1" in
    "-a") sudo htpasswd -b $PASSWDFILE $2 $3
    ;;
    "-d") sudo htpasswd -D $PASSWDFILE $2
    ;;
    "-u")
      sudo htpasswd -D $PASSWDFILE $2
      sudo htpasswd -b $PASSWDFILE $2 $3
    ;;
    "-l") cat $PASSWDFILE
  esac
fi

echo