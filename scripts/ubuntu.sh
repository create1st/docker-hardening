#!/bin/bash
set -xe

yes y | apt-get update
yes y | apt-get upgrade
rm -rf \
  /etc/fstab \
  /etc/logrotate.d \
  /etc/securetty \
  /etc/sysctl.conf \
  /etc/sysctl.d \
  /var/cache \
  /media \
  /mnt \
  /srv \
  /etc/shadow- \
  /etc/passwd- \
  /usr/bin/od \
  /bin/bash \
  /bin/dash \
  /bin/mount \
  /bin/ping \
  /bin/ping4 \
  /bin/ping6 \
  /bin/su \
  /bin/umount \
  /usr/bin/chfn \
  /usr/bin/chsh \
  /usr/bin/gpasswd \
  /usr/bin/newgrp \
  /usr/bin/passwd \
  /usr/bin/sg \
  /usr/lib/openssh/ssh-keysign \
  /etc/ssh \
  /usr/bin/ssh \
  /usr/lib/apt/methods/rsh \
  /var/lib/dpkg/alternatives/rsh

echo "Completed."

rm -- "$0"