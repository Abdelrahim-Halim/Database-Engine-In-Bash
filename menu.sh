#!/bin/bash

clear 
source color.sh

while [[ true ]]
do
	clear
	echo "*==You Are In ${PWD} Database==*"
	echo -e "*==== Choose operation's Number ${BLUE}1,2,..5${NC} ====*"
	echo "1- DISPLAY Tables"
	echo "2- SHOW Table content"
	echo "3- CREATE Table"		
	echo "4- INSERT INTO Table"
	echo -e "${YELLOW}5- UPDATE Table${NC}"
	echo -e "${RED}6- DELETE FROM Table${NC}"
	echo -e "${RED}7- DELETE table${NC}"
	echo "8- SELECT FROM TABLE"
	echo "9- Back "
	echo
	boy=$(ls | grep -v ".md$")
	read choice
	case $choice in
		1) echo
			echo "Your Tables Are : "
			if [[ -z $boy ]];then
				echo "Database Is Empty"
			else 
				ls | grep -v ".md$"
			fi
			echo
			echo "Press Enter to Continu..."
			read ;;
		2) if [[ -z $boy ]];then
				echo -e "${RED}Sorry, Database Is Empty${NC}"
				echo "Press Enter to Continu..."
				read
		  	else 
				showTableContent.sh
			fi ;;
		3) createTable.sh ;;
		4) if [[ -z $boy ]];then
			echo -e "${RED}Sorry, Database Is Empty${NC}"
			echo "Press Enter to Continu..."
			read
		else 
			insertInTable.sh
		fi;;
		5) if [[ -z $boy ]];then
			echo -e "${RED}Sorry, Database Is Empty${NC}"
			echo "Press Enter to Continu..."
			read
		else 
		 updateTable.sh
		fi;;
		6)if [[ -z $boy ]];then
			echo -e "${RED}Sorry, Database Is Empty${NC}"
			echo "Press Enter to Continu..."
			read
		else  
			delTableR.sh
		fi;;
		7) if [[ -z $boy ]];then
			echo -e "${RED}Sorry, Database Is Empty${NC}"
			echo "Press Enter to Continu..."
			read
		else  
			deleteTable.sh
		fi ;;
		8) if [[ -z $boy ]];then
			echo -e "${RED}Sorry, Database Is Empty${NC}"
			echo "Press Enter to Continu..."
			read
		else 
			select.sh
		fi ;;
		9) main.sh
			exit ;;
		*) echo -e "${RED}*=== Sorry, Choose operation's Number from the list ===*${NC}" ;;
	esac
done	 

