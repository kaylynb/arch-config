#!/bin/bash
ansible-playbook --diff --ask-become-pass ${HOSTNAME}.yml
