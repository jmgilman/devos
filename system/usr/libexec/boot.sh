#!/usr/bin/env bash

# Configure static IP address
nmcli con mod ens33 ipv4.addresses 192.168.0.40/24
nmcli con mod ens33 ipv4.gateway 192.168.0.1
nmcli con mod ens33 ipv4.dns 1.1.1.1
nmcli con mod ens33 ipv4.dns-search gilman.io
nmcli con mod ens33 ipv4.method manual
nmcli con up ens33

# Set hostname
hostnamectl set-hostname devos
