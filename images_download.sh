#!/bin/bash

gallery-dl -d /media/polyphemus/C802F15202F145CA/Pictures/ -R 5 --verbose $1

for file in "/media/polyphemus/C802F15202F145CA/Pictures/instagram/"*
do
	username="$(echo $(basename $file))"
	echo $username
	gallery-dl -d /media/polyphemus/C802F15202F145CA/Pictures/ -R 5 --verbose --sleep 6 https://www.instagram.com/$username
	python3 /home/polyphemus/Documents/github_clones/PyInstaStories/pyinstastories.py --download $username --output /media/polyphemus/C802F15202F145CA/Pictures/instagram --username [REDACTED] --password [REDACTED]
done


#pip install git+https://git@github.com/ping/instagram_private_api.git@1.6.0
#python3 -m pip install -U gallery-dl
