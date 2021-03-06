#!/bin/bash

sudo su - ansible
sudo apt-get update && sudo apt-get install -y libssl-dev libffi-dev python-dev python-pip
sudo pip install ansible

cd /home/ansible
echo "randompwd" > .pass
ansURI="https://github.com/Sebastian-Negoescu/Linux_HostedAgent.git"
export AGENTNAME=$(hostname)
git clone $ansURI
sudo chown -R ansible:ansible ./Linux_HostedAgent
cd Linux_HostedAgent/infra/ansible/vmAgent
ansible-playbook install.yml --extra-vars "azToken=<FILL_IN_THE_VALUE>>" -vvv
