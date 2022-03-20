#! /bin/bash
mv vars/example.config.yml vars/config.yml 
mv vars/example.secrets.vars.yml vars/secrets.vars.yml

xcode-select --install
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
ansible-galaxy install -r requirements.yml
ansible-playbook local.yml --ask-become-pass --vault-id @prompt