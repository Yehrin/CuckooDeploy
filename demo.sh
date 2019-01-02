#!/bin/bash



echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" $(tput sgr0)
echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>配置 AVD..." $(tput sgr0)
echo -e "\e[47;35m" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" $(tput sgr0)
(
	echo -e "\e[1;35m" "接下来，打开AVD，同时打开新的终端，运行 CuckooDroid_Install_Part2.sh 脚本：" $(tput sgr0)
	echo -e "\e[1;35m" "$ ./CuckooDroid_Install_Part2.sh" $(tput sgr0)
	read -p "按回车，开始打开AVD："
	cd CuckooDroid/
	./CuckooDroid_Start_AVD.sh
)
