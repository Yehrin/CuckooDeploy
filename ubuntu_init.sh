#!/bin/bash


echo -e "\e[42;37m" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" $(tput sgr0)
echo -e "\e[42;37m" ">>>>>>>>>>>>>>>>>>>>>>开始配置环境" $(tput sgr0)
echo -e "\e[42;37m" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" $(tput sgr0)



echo -e "\e[1;35m" "Set root passwd" $(tput sgr0)
sudo passwd root

sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt update -y
sudo apt --fix-broken install -y

TargetPath="/home/software/"
if [ ! -d $TargetPath ]; then
	sudo mkdir $TargetPath
fi

# To use ifconfig
sudo apt install -y net-tools

sudo apt install -y git


echo -e "\e[1;35m" "Installing ssh server..." $(tput sgr0)
(
	sudo apt install -y openssh-server
	sudo ps -e |grep ssh
)


echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" $(tput sgr0)
echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>安装 Chrome..." $(tput sgr0)
echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" $(tput sgr0)
(
	cd Chrome/
	sudo dpkg -i google-chrome-*.deb
)


echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" $(tput sgr0)
echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>安装 Sublimetext3..." $(tput sgr0)
echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" $(tput sgr0)
(
	cd SublimeText3/
	sudo cp -r sublime_text_3/ /opt/
	sudo ln -s /opt/sublime_text_3/sublime_ch /usr/bin/subl
	sudo cp /opt/sublime_text_3/sublime-text3.desktop /usr/share/applications/
	sudo chmod +x /usr/bin/subl
	sudo chmod +x /opt/sublime_text_3/sublime_text
)


echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" $(tput sgr0)
echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>安装 Pycharm..." $(tput sgr0)
echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" $(tput sgr0)
(
	cd Pycharm/
	sudo tar xf pycharm-*.tar.gz -C /home/software
	sudo cp pycharm.desktop /usr/share/applications/
)


echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" $(tput sgr0)
echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>安装 SogouInput..." $(tput sgr0)
echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" $(tput sgr0)
(
	cd SogouInput/
	sudo apt install -y fcitx
	sudo apt -y --fix-broken install
	sudo dpkg -i sogoupinyin_*.deb
)


echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" $(tput sgr0)
echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>Ubuntu 主题美化..." $(tput sgr0)
echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" $(tput sgr0)
(
	cd 美化/
	# 安装工具
	sudo apt install -y gnome-tweak-tool
	sudo apt install -y gnome-shell-extensions
	sudo apt install -y gnome-shell-extension-dashtodock
	sudo apt install -y gnome-themes-standard
	sudo dpkg -i osx-arc-collection*.deb

	# 修改图标
	git clone https://github.com/zayronxio/Zafiro-icons.git
	sudo mv Zafiro-icons/ /usr/share/icons/
	# 设置壁纸
	gsettings set org.gnome.desktop.background picture-uri "http://static01.coloros.com/bbs/data/attachment/forum/201503/16/185245yo87u5380677of6f.jpg"

	# 下载登录界面主题
	## git clone https://github.com/EugeneVe/SetAsWallpaper.git
	cd SetAsWallpaper/
	sudo chmod +x install.sh
	./install.sh
)


echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" $(tput sgr0)
echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>安装 JDK8..." $(tput sgr0)
echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" $(tput sgr0)
(
	sudo apt-get install -y openjdk-8-jdk
)


echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" $(tput sgr0)
echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>安装 Python2, pip & Packages..." $(tput sgr0)
echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" $(tput sgr0)
(
	sudo apt-get install -y python python-pip python-setuptools
	sudo apt-get install -y python-dev
)


echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" $(tput sgr0)
echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>安装 Python3, pip3 & Packages..." $(tput sgr0)
echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" $(tput sgr0)
(
	sudo apt-get install -y python3-pip
	sudo pip3 install jupyter
)

echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" $(tput sgr0)
echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>是否安装 Android SDK..." $(tput sgr0)
echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" $(tput sgr0)
read -n 1 -p "press Enter to install SDK, others to cancel:" sdk_install

if [ -z $sdk_install ]; then
	# input Enter
	(
		cd Android_SDK/
		chmod +x SDK_Init.sh
		chmod +x AVD_Init.sh
		./SDK_Init.sh
	)
fi



echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" $(tput sgr0)
echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>是否安装 CuckooDroid..." $(tput sgr0)
echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" $(tput sgr0)
read -n 1 -p "press Enter to install SDK, others to cancel:" cuckoo_install

if [ -z $cuckoo_install ]; then
	# input Enter
	(
		cd CuckooDroid/
		chmod +x SDK_Init.sh
		./SDK_Init.sh
	)
fi








echo -e "\e[42;37m" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo -e "\e[42;37m" ">>>>>>>>>>>>>>>>>>>>>>结束环境配置"
echo -e "\e[42;37m" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" $(tput sgr0)

