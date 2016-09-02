#!/bin/bash
ansible-playbook --diff ${HOSTNAME}.yml --tags bootstrap
