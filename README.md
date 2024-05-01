# DevOS

> Custom BlueOS image for my personal development machine

This repository contains the code for building the OS powering my development machine.
It is based off [Universal Blue](https://universal-blue.org/) and inherits from [Project Bluefin](https://projectbluefin.io/).

## Usage

When a new tag is pushed to the repository, the CI system will automatically generate a bootable ISO image for installing the
system.
The ISO file is attached as an output artifact of the CI job due to the 2GB limit of GitHub releases.
If an ISO file has not been generated, push a new tag to the repository in order to force generation of the ISO.

Once the ISO has been obtained, boot it from the target system and run through the installer (leaving defaults in place).
After installation, the machine will boot up and be configured with the following IP address: `192.168.0.40`.
The `devos.gilman.io` address should be configured to point to this IP address.

After the system is booted, run the `bootstrap.sh` script from this repository on a machine that has access to `gopass`.
This script will fetch the machine's SSH keys from `gopass` and insert them into the newly created machine.
It will also automatically start an SSH connection to the machine.

Once connected to the machine, run the `setup.sh` script located at the root of the home directory.
This script will perform all initial configuration steps in order to setup the system.
After this, the machine is ready for use.