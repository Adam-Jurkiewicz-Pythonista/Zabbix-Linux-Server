#!/bin/bash
#
ufw status
ufw allow 80/tcp
ufw allow 443/tcp
ufw status verbose

