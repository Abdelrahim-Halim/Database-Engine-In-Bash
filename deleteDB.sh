#!/bin/bash

clear
source color.sh
cd /home/$USER/Desktop/databases
while true
do
	echo "Enter Your Database Name To Delete It"
	read dbname
	if [ -z "${dbname}" ];then
		echo -e "${RED}You Must Enter Your Database Name \n${NC}"
	else
		if [ -d "${dbname}" ];then
			rm -r $dbname
			echo "${dbname} Database deleted sucssesfully 😎"
			sleep 2
		else
			echo -e "${RED}No Database Found , Bye 👋 ${NC}"
			sleep 2
		fi
		break
	fi
done


