#!/bin/bash
set -e

if [ "$1" = '/docker-command.sh' ]; then
    SHELLINABOX_USER=statauser
	# set user password
	echo "========================================================================="
		if [ ! -n "$PASSWORD" ]; then
		    echo "WARNING: no password set, generating random password!"
		    PASSWORD=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13 ; echo '')
			echo "Password set to: $PASSWORD"
		fi
		if [ -n "$PASSWORD" ]; then
			echo "set password for user: $SHELLINABOX_USER"
			echo "$SHELLINABOX_USER:$PASSWORD" | chpasswd
		fi
	unset SHELLINABOX_PASSWORD
	echo "========================================================================="
fi
cd /tmp
exec $@

