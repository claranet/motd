#!/bin/bash
set -euo pipefail

# empty native static motd to prevent usage elsewhere (motd=/etc/motd from pam_motd.so or PrintMotd from sshd)
truncate -s0 /etc/motd
# create dedicated directory following ubuntu to contain required files
mkdir -p /etc/update-motd.d/
# copy the static motd banner into this directory in place of /etc/motd
cp motd /etc/update-motd.d/
# disable any existing script in this directory (e.g. for ubunutu)
chmod -x /etc/update-motd.d/*
# enable claranet motd script
cp --preserve=mode scripts/* /etc/update-motd.d/

echo "Claranet motd successfully installed!"
echo "For distributions which does not use update-motd (e.g. ubuntu/debian), do not forget to add the following to /etc/pam.d/sshd:"
echo "session    optional   pam_exec.so          stdout /etc/update-motd.d/00-basic"
