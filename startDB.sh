#!/bin/bash

source color.sh
if [ -d /home/$USER/Desktop/databases ];then
	echo -e "${BLUE}*==== SA3EDY DATABASE has been installed before ====*${NC}"
	echo "Loading ..."
	sleep 2
else 
	clear
	echo -e "${RED}*==== SA3EDY DATABASE hasn't been installed before ====*${NC}"
	sleep 1
	echo -e "${BLUE}*==== STRAT INSTALLING FOR YOUR EYES 😉 ====*${NC}"
	sleep 2
	clear	
	echo "installing SA3EDY DATABASE {=   }"
	sleep 1
	clear
	echo "installing SA3EDY DATABASE {==  }"	
	sleep 2
	clear
	echo "installing SA3EDY DATABASE {=== }"	
	sleep 2
	clear
	echo "installing SA3EDY DATABASE {====}"	
	sleep 2
	clear
	echo "*==== SA3EDY DATABASE installed 😎 ====*"	
	mkdir /home/$USER/Desktop/databases
	echo "Loading ..."
	sleep 2
fi
export PATH=$PATH:$PWD
source main.sh

