#!/bin/bash
clear
source color.sh
echo -e "${BLUE}Which table U want to show !${NC}"
read table_name

if [ -f "$table_name" ];then	
	echo
	echo  "*=============== Table $table_name ===============*"
	awk 'BEGIN {FS=":"} {if(NR>0) printf $1"\t|\t"} END{printf "\n"}' $table_name.md
	awk 'BEGIN{FS=" ";OFS="\t|\t";ORS="\n";}{  $1=$1; print substr($0, 1, length($0))}' $table_name
	echo  "*============================================================*"
	echo 
	echo "press ENTER to back..."	
	read 
else
	echo -e "${RED}*==== No table matched ====*${NC}"
	echo "For help use DISPLAY TABLES option To Know Your Tables And Come Again ✌"
	echo "press ENTER to back..."	
	read
fi
