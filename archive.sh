#!/bin/bash

rsync -uPArv ~/Videos /media/polyphemus/C802F15202F145CA
rsync -uPArv ~/Documents /media/polyphemus/C802F15202F145CA
rsync -uPArv ~/Pictures /media/polyphemus/C802F15202F145CA

cp ~/.newsboat/config ~/Documents/repositories/dotfiles/.newsboat/
cp ~/.newsboat/urls ~/Documents/repositories/dotfiles/.newsboat/
cp -r ~/.ncmpcpp ~/Documents/repositories/dotfiles/
cp ~/.mozilla/firefox/097lo5ak.default-release/chrome/userChrome.css ~/Documents/repositories/dotfiles/.mozilla/firefox/097lo5ak.default-release/chrome/
cp ~/.Xresources ~/Documents/repositories/dotfiles/

cp ~/.config/fontconfig/fonts.conf ~/Documents/repositories/dotfiles/.config/fontconfig/
cp ~/.config/i3/config ~/Documents/repositories/dotfiles/.config/i3/
cp ~/.config/mpd/mpd.conf ~/Documents/repositories/dotfiles/.config/mpd/
cp -r ~/.config/mpv ~/Documents/repositories/dotfiles/.config/
cp -r ~/.config/nvim ~/Documents/repositories/dotfiles/.config/
cp ~/.config/ranger/rc.conf ~/Documents/repositories/dotfiles/.config/ranger/
cp -r ~/.config/zathura ~/Documents/repositories/dotfiles/.config/

cd Documents/repositories/dotfiles/
git add .
git commit -m "Update"
#git remote add origin https://github.com/nlogocntrcaphnt/dotfiles.git
git push -u origin main

#for file in /home/polyphemus/*; do
#    if [[ $file == *".sh"* ]]
#	then
#		echo $file
#		cp $file ~/Documents/repositories/scripts/
#	fi
#done

cp ~/installation.sh ~/Documents/repositories/scripts/
cp ~/archive.sh ~/Documents/repositories/scripts/
cp ~/media_download.sh ~/Documents/repositories/scripts/
cp ~/threader_fetch.sh ~/Documents/repositories/scripts/

cd ~/Documents/repositories/scripts/
git add .
git commit -m "Update"
#git remote add origin https://github.com/nlogocntrcaphnt/scripts.git
git push -u origin main


