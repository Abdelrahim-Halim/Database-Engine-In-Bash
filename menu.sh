#!/bin/bash

clear 
source color.sh

while [[ true ]]
do
	clear
	echo "*==${PWD}==*"
	echo -e "*==== Choose operation's Number 1,2,..5 ====*"
	echo "1- DISPLAY Tables"
	echo "2- SHOW Table content"
	echo "3- CREATE Table"		
	echo "4- INSERT INTO Table"
	echo "5- UPDATE Table"
	echo "6- DELETE FROM Table"
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
			sleep 3;;
		2) if [[ -z $boy ]];then
			echo "Database Is Empty"
			sleep 2
		else 
			showTableContent.sh
		fi
		;;
		3) createTable.sh;;
		4) if [[ -z $boy ]];then
			echo "Database Is Empty"
			sleep 2
		else 
			insertInTable.sh
		fi ;;
		5) if [[ -z $boy ]];then
			echo "Database Is Empty"
			sleep 2
		else 
		 updateTable.sh
		fi;;
		6)if [[ -z $boy ]];then
			echo "Database Is Empty"
			sleep 2
		else  
			delTableR.sh
		fi;;
		7) if [[ -z $boy ]];then
			echo "Database Is Empty"
			sleep 2
		else  
			deleteTable.sh
		fi ;;
		8) if [[ -z $boy ]];then
			echo "Database Is Empty"
			sleep 2
		else 
			select.sh
		fi ;;
		9) main.sh
			exit ;;
		*) echo "${RED}*=== Sorry, Choose operation's Number from the list ===*${NC}"
	esac
done	 

