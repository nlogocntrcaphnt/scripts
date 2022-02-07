#!/bin/bash

if ! [ -z "$(echo $1 | grep "youtu")" ]
then
	if ! [ -z "$(echo $1 | grep "channel")" ]
	then
		CHANNEL="$(curl $1 | grep "<title>" | cut -d ">" -f2 | cut -c 3-)"
		DIR="/home/kostis/Videos/YouTube/${CHANNEL}"
		if ! [ -d "$DIR" ]; then
  			mkdir "$DIR"
		fi
		youtube-dl --ignore-errors -o "$DIR/%(title)s.%(ext)s" $1
	else
#		echo "Is it an audiobook? (Y/N)"; read -r answer
#		if [ "$answer" == "Y" ]; then
#			youtube-dl -x -f bestaudio/best "~/Music/Audiobooks/%(title)s.%(ext)s" $1
#		else
			yt-dlp -o "~/Videos/YouTube/%(title)s.%(ext)s" $1
#		fi
	fi
elif ! [ -z "$(echo $1 | grep "twitter")" ]
then
	yt-dlp -o "~/Videos/Twitter/%(title)s.%(ext)s" $1
elif ! [ -z "$(echo $1 | grep "soundcloud")" ]
then
	CHANNEL="$(curl $1 | grep "<title>" | sed 's/^.*by/by/' | cut -c 4- | cut -d "|" -f1)"
	DIR="/home/kostis/Music/Podcasts/${CHANNEL}"
		if ! [ -d "$DIR" ]; then
  			mkdir "$DIR"
		fi
		youtube-dl --ignore-errors -o "$DIR/%(title)s.%(ext)s" $1
else
	youtube-dl -o -i "~/Videos/" $1
fi
