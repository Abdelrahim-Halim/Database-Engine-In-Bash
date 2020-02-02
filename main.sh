#!/bin/bash

clear 
source color.sh

echo -e "${BLUE}*===== WELCOME TO SA3EDY DATABASE ENGIN WRITTEN BASH =======*${NC}"
echo -e "${BLUE}*======= OPEN SOURCE CLOUD PLATFORM APPLICATION =======*${NC}"
echo -e "${RED}*========= Powerd by: HALIM and MOHAMED ATEF =======*${NC}"

while [[ true ]]
do
	clear
	echo -e "*==== Choose operation's Number 1,2,..5 ====*"
	echo "1- CREATE database"
	echo "2- USE database"
	echo -e "${RED}3- DELETE database${NC}"
	echo "4- DISPLAY databases"
	echo "5- EXIT "
	echo
	read choice
	case $choice in
		1) creatDB.sh ;;
		2) source useDB.sh;;
		3) source deleteDB.sh;;
		4) clear
		   echo -e "Your Databases are..."
		   ls /home/$USER/Desktop/databases | cut -f1 -d" " 
		   sleep 5;;
		5) echo -e "${YELLOW}See U soon..${NC}"
		   echo
		   sleep 2
		   exit;;
		*) echo -e "${RED}*=== Sorry, Choose operation's Number from the list ===*${NC}"
		   sleep 2 ;;
	esac
done	 

