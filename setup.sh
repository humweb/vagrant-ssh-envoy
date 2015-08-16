#!/usr/bin/env bash

############# CONFIGURATION ##############

# Project Directory
PROJECT_DIR=$(pwd)

# Vagrant unsecure private key
PRIVATE_KEY=$(cd ../../.vagrant/machines/default/virtualbox; pwd)

# SSH config file
SSH_CONFIG_FILE=~/.ssh/config


############# FUNCTIONS ##############

function append_ssh_config {
cat >> $SSH_CONFIG_FILE <<EOL

Host vagrant
    Hostname 127.0.0.1
    Port 2222
    User vagrant
    IdentityFile=$1/private_key
EOL
}

# Colors, formatting, etc.
normal() {
	printf "$1\n"
}

success() {
	printf "\e[0;32m$1\e[0m\n"
}

notice() {
	printf "\e[0;33m$1\e[0m\n"
}


############# LOGIC ##############

normal " "
notice ">>> Starting Configuration..."
normal " "

if grep -Fxq "Host vagrant" $SSH_CONFIG_FILE
then
    notice ">>> SSH already configured."
else
    append_ssh_config "$PRIVATE_KEY"
    success ">>> SSH Configured."
fi
normal " "
success ">>> All setup, now just run: ./envoy.phar run <update|install|gulp>"
