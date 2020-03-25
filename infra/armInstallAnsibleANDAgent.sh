#!/bin/bash

sudo apt-get update && sudo apt-get install -y libssl-dev libffi-dev python-dev python-pip
sudo pip install ansible

cd /home/ansible
echo "randompwd" > .pass
ansURI="https://github.com/Sebastian-Negoescu/Linux_HostedAgent.git"
git clone $ansURI
sudo chown -R ansible:ansible ./Linux_HostedAgent/infra/ansible/vmAgent
cd Linux_HostedAgent/infra/ansible/vmAgent
echo "txmvg74uf4ja3zjovmosm2fzldtkjhribgeltjzr7ayeeazki2nq" > ./group_vars/all/vault.yml
ansible-vault encrypt ./group_vars/all/vault.yml --vault-password-file ~/.pass
ansible-playbook install.yml --vault-password-file ~/.pass -vvv
