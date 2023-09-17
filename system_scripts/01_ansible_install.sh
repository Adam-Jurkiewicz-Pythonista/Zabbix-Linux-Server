#!/bin/bash
#
apt-add-repository --yes --update ppa:ansible/ansible
apt install ansible
ansible --version
ansible-config init --disabled -t all >/etc/ansible/ansible.cfg
ssh-keygen -t ed25519 -C ansible-server

