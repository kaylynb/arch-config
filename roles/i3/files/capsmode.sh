#!/bin/bash

if setxkbmap -query | grep -q 'ctrl:nocaps'; then
	echo 'CTRL'
else
	echo 'BKSP'
fi
