## Dumb install

1. Write a `vars/secret.vars.yml` and `vars/config.yml` file containing desired config (Reco: Run `ansible-vault encrypt vars/secret.vars.yml` and "safely" store (even in git))
   - Note that everything inside `secret.vars.yml` will be merged with `config.yml` variables
2. Run `init.sh`

## Useful infos

> https://stackoverflow.com/questions/63263190/ansible-multiple-vars-files-with-same-yaml-structure-do-not-merge

## Installation

1. Ensure Apple's command line tools are installed (`xcode-select --install` to launch the installer).
2. [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html):

   1. Run the following command to add Python 3 to your $PATH: `export PATH="$HOME/Library/Python/3.8/bin:/opt/homebrew/bin:$PATH"`
   2. Upgrade Pip: `sudo pip3 install --upgrade pip`
   3. Install Ansible: `pip3 install ansible`

3. Clone or download this repository to your local drive.
4. Write/Retrieve 2 proper configs:

   - `vars/secret.vars.yml`

     Containing all secret vars (encrypted via `ansible-vault encrypt vars/secret.vars.yml`) - see `example.secret.vars.yml`

   - `vars/config.yml`

     Containing all packages, apps and dock things to install - see `example.config.yml`

5. Run `ansible-galaxy install -r requirements.yml` inside this directory to install required Ansible roles.
6. Run `ansible-playbook local.yml --ask-become-pass --vault-id @prompt` inside this directory. Enter your macOS account password when prompted for the 'BECOME' password.

> Note: If some Homebrew commands fail, you might need to agree to Xcode's license or fix some other Brew issue. Run `brew doctor` to see if this is the case.
