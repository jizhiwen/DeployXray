#!/bin/sh

echo "# enable swap" >> /etc/sysctl.conf
echo "vm.swappiness=60" >> /etc/sysctl.conf
sysctl -p

dd if=/dev/zero of=/mnt/swap bs=1024000 count=500
chmod 0600 /mnt/swap
mkswap /mnt/swap
swapon /mnt/swap
