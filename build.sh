#!/bin/bash

set -ouex pipefail

# RELEASE="$(rpm -E %fedora)"

# Enable our custom boot script
systemctl enable first-boot.service

# Enable SSH daemon by default
systemctl enable sshd

# Disable sudo password prompt
sed -i -e '/^%wheel[[:space:]]\+ALL=(ALL)[[:space:]]\+NOPASSWD:[[:space:]]\+ALL/s/^/#/' -e '/^# %wheel[[:space:]]\+ALL=(ALL)[[:space:]]\+NOPASSWD:[[:space:]]\+ALL/s/^# //' /etc/sudoers
