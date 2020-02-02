#!/bin/bash

clear 
source color.sh

echo -e "${BLUE}*===== WELCOME TO SA3EDY DATABASE ENGIN WRITTEN BASH =======*${NC}"
echo -e "${BLUE}*======= OPEN SOURCE CLOUD PLATFORM APPLICATION =======*${NC}"
echo -e "${RED}*========= Powerd by: HALIM and MOHAMED ATEF =======*${NC}"

while [[ true ]]
do
	echo
	echo -e "*==== Choose operation's Number 1,2,..5 ====*"
	echo "1- CREATE database"
	echo "2- USE database"
	echo "${RED}3- DELETE database${NC}"
	echo "4- DISPLAY databases"
	echo "5- EXIT "
	echo
	read choice
	case $choice in
		1) source createdatabse.sh;;
		2) source usedatabase.sh;;
		3) source deletedatabase.sh;;
		4) source showdatabases.sh;;
		5) echo "${YELLOW} See U soon..${NC}"
		   exit;;
		*) echo "${RED}*=== Sorry, Choose operation's Number from the list ===*${NC}"
	esac
done	 

