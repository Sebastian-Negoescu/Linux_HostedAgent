#!/bin/bash

sudo apt-get update && sudo apt-get install -y libssl-dev libffi-dev python-dev python-pip
sudo pip install ansible

cd /home/ansible
ansURI="https://github.com/Sebastian-Negoescu/Linux_HostedAgent.git"
git clone $ansURI
sudo chown -R ansible:ansible ./Linux_HostedAgent/infra/ansible/vmAgent
cd Linux_HostedAgent/infra/ansible/vmAgent
ansible-playbook install.yml -vvv
