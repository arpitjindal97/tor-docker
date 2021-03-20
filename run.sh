#!/bin/bash

## Environemnt variables explanied
#
# VPN		-	(boolean) enable or disable vpn
# SERVER	-	(string) URL of the server to connect to
# USER		-	(string) username of VPN server
# PASS		-	(string) password of VPN server

if ($VPN);
then
	echo "Enabling VPN"
    echo "$USER : EAP \"$PASS\""  > /etc/ipsec.secrets
    sed -i "s/USER/$USER/g" /etc/ipsec.conf
    sed -i "s/SERVER/$SERVER/g" /etc/ipsec.conf
    ipsec start
fi
sleep 10

# Starting tor
tor