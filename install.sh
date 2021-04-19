#!/bin/bash

truncate -s0 /etc/motd           # empty native static motd
mkdir -p /etc/update-motd.d/     # create dedicated directory following ubuntu
cp motd /etc/update-motd.d/      # copy the static motd banner into it
chmod -x /etc/update-motd.d/*    # disable any existing script
cp scripts/* /etc/update-motd.d/ # enable claranet motd script

echo "For distributions which does not use update-motd (e.g. ubuntu/debian), do not forget to add the following to /etc/pam.d/sshd:"
echo "session    optional   pam_exec.so          stdout /etc/update-motd.d/00-basic"
