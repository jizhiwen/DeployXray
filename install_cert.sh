#!/bin/sh

if [ ! $# -eq 1 ];then
	echo usage: $0 domine
	exit 1
fi

domine=$1

if [ ! -d /etc/pki/nginx/private ];then
	mkdir -p /etc/pki/nginx/private
fi
/root/.acme.sh/acme.sh --installcert -d $domine \
	--cert-file /etc/pki/nginx/server.crt \
	--key-file /etc/pki/nginx/private/server.key \
	--fullchain-file /etc/pki/nginx/fullchain.crt \
	--ecc \
	--reloadcmd "systemctl restart nginx"


if [ ! -d /etc/pki/xray/private ];then
	mkdir -p /etc/pki/xray/private
fi
/root/.acme.sh/acme.sh --installcert -d $domine \
	--cert-file /etc/pki/xray/xray.crt \
	--key-file /etc/pki/xray/private/xray.key \
	--fullchain-file /etc/pki/nginx/fullchain.crt \
	--ecc \
	--reloadcmd "docker restart xray"
