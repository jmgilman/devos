#!/usr/bin/env bash

echo ">>> Making temporary directory..."
mkdir -p /tmp/devos

echo ">>> Copying bootstrap SSH key..."
gopass show ssh/bootstrap-priv >/tmp/devos/id_ed25519_bootstrap
gopass show ssh/bootstrap-pub >/tmp/devos/id_ed25519_bootstrap.pub

echo ">>> Copying DevOS SSH key..."
gopass show ssh/devos-priv >/tmp/devos/id_ed25519_devos
gopass show ssh/devos-pub >/tmp/devos/id_ed25519_devos.pub

echo ">>> Setting permissions..."
chmod 0600 /tmp/devos/*

echo ">>> Purging existing known_hosts..."
ssh-keygen -R devos.gilman.io

scp -i /tmp/devos/id_ed25519_bootstrap /tmp/devos/id_ed25519_devos josh@devos.gilman.io:.ssh/id_ed25519_devos
scp -i /tmp/devos/id_ed25519_bootstrap /tmp/devos/id_ed25519_devos.pub josh@devos.gilman.io:.ssh/id_ed25519_devos.pub

echo ">>> Connecting to DevOS..."
echo ">>> Please run setup.sh on the remote machine."
ssh -i /tmp/devos/id_ed25519_bootstrap josh@devos.gilman.io

echo ">>> Cleaning up..."
rm -rf /tmp/devos
