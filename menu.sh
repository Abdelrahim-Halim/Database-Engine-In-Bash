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
	echo -e "${RED}6- DELETE table${NC}"
	echo "7- SELECT FROM TABLE"
	echo "8- Back "
	echo
	read choice
	case $choice in
		1) ls ;;
		2) source showTableContent.sh;;
		3) source createTable.sh;;
		4) source insertInTable.sh;;
		5) source updateTable;;
		6) source deleteTable.sh;;
		7) source select.sh;;
		8) source main.sh;;
		*) echo "${RED}*=== Sorry, Choose operation's Number from the list ===*${NC}"
	esac
done	 

