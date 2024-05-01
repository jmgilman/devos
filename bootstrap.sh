#!/usr/bin/env bash

echo ">>> Making temporary directory..."
mkdir -p /tmp/devos

echo ">>> Copying local SSH key..."
ssh-copy-id -f -o 'IdentityFile ~/.ssh/id_ed25519_bootstrap' -i ~/.ssh/id_ed25519_studio josh@devos.gilman.io

echo ">>> Copying devos SSH key..."
gopass show ssh/devos-priv >/tmp/devos/id_ed25519_devos
gopass show ssh/devos-pub >/tmp/devos/id_ed25519_devos.pub

scp -i ~/.ssh/id_ed25519_studio /tmp/devos/id_ed25519_devos josh@devos.gilman.io:.ssh/id_ed25519_devos
scp -i ~/.ssh/id_ed25519_studio /tmp/devos/id_ed25519_devos.pub josh@devos.gilman.io:.ssh/id_ed25519_devos.pub

echo ">>> Cleaning up..."
rm -rf /tmp/devos
