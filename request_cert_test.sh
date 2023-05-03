#!/bin/sh

if [ ! $# -eq 1 ];then
	echo usage: $0 domine
	exit 1
fi

domine=$1

/root/.acme.sh/acme.sh --issue --server letsencrypt --test \
	-d $domine \
	-w /usr/share/nginx/html \
	--keylength ec-256
