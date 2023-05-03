#!/bin/sh

docker run -d --network=host --restart=always --name xray \
       	-v /etc/xray:/etc/xray \
	-v /etc/pki/xray:/etc/pki/xray \
	-v /var/log/xray:/var/log/xray \
	teddysun/xray
