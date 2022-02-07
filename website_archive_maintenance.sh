#!/bin/bash

for file in ~/Documents/website_archive/*
do
	website="$(echo $(basename $file))"
	echo https://$website
	wget -r -nc -P ~/Documents/website_archive/ $website
done
