#!/usr/bin/env bash

# Configure SSH
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519_devos

# Clone home-manager repository
git clone git@github.com:jmgilman/devos.git ~/.devos

# Call setup script
~/.devos/setup.sh
