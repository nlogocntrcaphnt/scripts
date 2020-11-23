#!/bin/bash

gallery-dl -d /home/kostis/Pictures/ -R 5 --verbose $1

for file in /home/kostis/Pictures/instagram/*; do
	username="$(echo "${file##*/}")"
	echo $username
	gallery-dl -d /home/kostis/Pictures/ -R 5 --verbose https://www.instagram.com/$username
done
