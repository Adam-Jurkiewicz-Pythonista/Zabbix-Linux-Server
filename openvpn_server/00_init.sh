#!/bin/bash
#
# install software
apt install openvpn
#
# create special file with Random Generator
# more info: https://www.openssl.org/docs/man1.1.1/man1/openssl-rand.html
openssl rand -writerand /root/.rnd
