#!/bin/sh

if [ ! $# -eq 1 ];then
	echo usage: $0 domine
	exit 1
fi

domine=$1

/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt

/root/.acme.sh/acme.sh --issue --force \
	-d $domine \
	-w /usr/share/nginx/html \
	--keylength ec-256
