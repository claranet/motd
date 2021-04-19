# Motd

Here is motd for Claranet.

## Preparation

Make sure you have the `PrintMotd` option set to `yes` in your sshd config.

You could also want to disable the "last login" information by configuring `PrintLastLog` to `no`.

Don't forget to restart sshd after.

## Installation

Copy [motd](motd) file to `/etc/motd`.
