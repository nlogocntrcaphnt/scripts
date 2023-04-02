mkdir Pictures/screenshots
mkdir Music/Artists

sudo pacman -S Syyu

#enable bitmap fonts
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf

sudo pacman -S git

mkdir Pictures/screenshots

cd Documents
mkdir repositories
cd repositories

git clone https://github.com/nlogocntrcaphnt/dotfiles.git
git clone https://github.com/nlogocntrcaphnt/scripts.git
git clone https://github.com/nlogocntrcaphnt/Homepage.git
git clone https://github.com/nlogocntrcaphnt/LaTeX_personal_dictionary.git

cd dotfiles

mv config .config
mv mpd .mpd 
mv ncmpcpp .ncmpcpp
mv newsboat .newsboat
mv vim .vim
mv fonts .fonts

cp -r .config /home/polyphemus/
cp -r .mpd /home/polyphemus/
cp -r .ncmpcpp /home/polyphemus/
cp -r .newsboat /home/polyphemus/
cp -r .vim /home/polyphemus/
cp -r .fonts /home/polyphemus/

cp compton.conf /home/polyphemus/
cp .asoundrc /home/polyphemus/
cp .bashrc /home/polyphemus/
cp .rtorrent.rc /home/polyphemus/
cp .Xresources /home/polyphemus/
cp wallpaper_test.jpeg ~/Pictures/

#essentials
sudo pacman -S i3-gaps i3status i3lock dmenu rxvt-unicode xclip maim neovim feh
sudo pacman -S base-devel python curl python-setuptools rsync

#media handling
sudo pacman -S gimp obs-studio mpv youtube-dl yt-dlp

#system information
sudo pacman -S htop neofetch

#media library and feed interactions
sudo pacman -S mpd ncmpcpp newsboat 

#ancillaries
sudo pacman -S yay
yay -S task-spooler soulseekqt
