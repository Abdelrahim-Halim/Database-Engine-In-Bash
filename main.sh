#!/bin/bash

clear 
source color.sh

echo -e "${BLUE}*===== WELCOME TO SA3EDY DATABASE ENGIN WRITTEN BASH =======*${NC}"
echo -e "${BLUE}*======= OPEN SOURCE CLOUD PLATFORM APPLICATION =======*${NC}"
echo -e "${RED}*========= Powerd by: HALIM and MOHAMED ATEF =======*${NC}"

while [[ true ]]
do
	clear
	echo -e "*==== Choose operation's Number ${BLUE}1,2,..5${NC} ====*"
	echo "1- CREATE database"
	echo -e "2- ${YELLOW}USE database${NC}"
	echo -e "3- ${RED}DELETE database${NC}"
	echo "4- DISPLAY databases"
	echo -e "5- ${RED}EXIT ${NC}"
	echo
	boy=$(ls /home/$USER/Desktop/databases | cut -f1 -d" ")
	read choice
	case $choice in
		1) creatDB.sh ;;
		2) if [[ -z $boy ]];then
			echo -e "${RED}Sorry, You Don't Have Databases Yet..${NC}"
		   	echo "Press Enter to Continu..."
		   	read
		   else 
			useDB.sh			
		   fi;;
		3) if [[ -z $boy ]];then
			echo -e "${RED}Sorry, You Don't Have Databases Yet..${NC}"
			echo "Press Enter to Continu..."
			read		
		   else
			 deleteDB.sh
		   fi;;
		4) if [[ -z $boy ]];then
			echo -e "${RED}Sorry, You Don't Have Databases Yet..${NC}"
		   else
			clear
		   	echo -e "Your Databases are..."
			ls /home/$USER/Desktop/databases | cut -f1 -d" "
			echo  
		   fi 
		   echo "Press Enter to Continu..."
		   read;;
		5) echo -e "${YELLOW}See U soon..👋🤝${NC}"
		   echo
		   sleep 2
		   exit ;;
		*) echo -e "${RED}*=== Sorry, Choose operation's Number from the list ===*${NC}"
		   echo "Press Enter to Continu..."
		   read ;;
	esac
done	 

