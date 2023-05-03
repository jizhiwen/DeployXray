#!/bin/sh

dnf install socat
curl https://get.acme.sh | sh

/root/.acme.sh/acme.sh --upgrade --auto-upgrade
