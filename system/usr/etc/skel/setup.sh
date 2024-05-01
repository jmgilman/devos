#!/usr/bin/env bash

# Install Nix
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# Install Devbox
curl -fsSL https://get.jetify.com/devbox | bash

# Configure SSH
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519_devos

# Pull GPG key
gpg --help  # Generate .gnupg
rm ~/.gnupg/common.conf
echo "pinentry-program /usr/bin/pinentry" >~/.gnupg/gpg-agent.conf
gpg --keyserver keys.gnupg.net --recv-keys 0x8C15553EEB22DB2A

# Change default shell to zsh
chsh -s /bin/zsh

# Clone DevOS repository
git clone git@github.com:jmgilman/devos.git ~/.devos

# Switch to home-manager
nix run home-manager -- switch --flake /home/josh/.devos#josh@devos