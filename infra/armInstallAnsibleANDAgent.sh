#!/bin/bash

sudo apt-get update && sudo apt-get install -y libssl-dev libffi-dev python-dev python-pip
sudo pip install ansible

cd /home/ansible
ansURI="https://github.com/Sebastian-Negoescu/Linux_HostedAgent.git"
git clone $ansURI
cd Linux_HostedAgent/infra/ansible/vmAgent
ansible-playbook install.yml -i inventories/azdevops -vvv
