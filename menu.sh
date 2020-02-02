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
	read choice
	case $choice in
		1) echo
			echo "Your Tables Are : "
			ls | grep -v ".md$"
			sleep 3;;
		2) showTableContent.sh;;
		3) createTable.sh;;
		4) insertInTable.sh;;
		5) updateTable.sh;;
		6) delTableR.sh;;
		7) deleteTable.sh;;
		8) select.sh;;
		9) main.sh;;
		*) echo "${RED}*=== Sorry, Choose operation's Number from the list ===*${NC}"
	esac
done	 

