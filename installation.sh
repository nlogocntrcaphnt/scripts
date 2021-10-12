sudo add-apt-repository ppa:oibaf/graphics-drivers
sudo apt update
sudo apt upgrade
sudo apt install libvulkan1 mesa-vulkan-drivers vulkan-utils

sudo apt install git
cd Documents
mkdir repositories
cd repositories
git clone https://github.com/nlogocntrcaphnt/dotfiles.git
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

cd

sudo apt install neovim mpd ncmpcpp mpc rxvt-unicode newsboat dmenu xclip maim feh rsync i3status i3lock autoconf make xutils-dev build-essential ffmpeg task-spooler audacity neofetch ffmpegthumbnailer zathura lxappearance rtorrent sdcv texlive-latex-extra openssh-server python curl python3-pip
xrdb .Xresources

sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt-get update
sudo apt install i3-gaps

sudo add-apt-repository ppa:mc3man/mpv-tests
sudo apt update
sudo apt install mpv

sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

cd Documents/repositories/
git clone https://github.com/nlogocntrcaphnt/scripts.git
cd scripts

for file in /home/polyphemus/Documents/scripts/*; do
    if [[ $file == *".sh"* ]] 
	then
		script="$(echo "${file##*/}")"
		cp $script /home/polyphemus/
	fi
done

mkdir ~/Pictures/screenshots
mkdir ~/Pictures/screenshots_mpv

sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key

sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' 
sudo apt update
sudo apt install --install-recommends winehq-staging

cd Downloads
git clone https://github.com/doitsujin/dxvk.git
cd dxvk
export WINEPREFIX=~/.wine
./setup_dxvk.sh install

#enable bitmap fonts
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
dpkg-reconfigure fontconfig-config
dpkg-reconfigure fontconfig
fc-cache -f

cd
cd Documents/repositories
git clone https://github.com/nlogocntrcaphnt/Homepage.git
