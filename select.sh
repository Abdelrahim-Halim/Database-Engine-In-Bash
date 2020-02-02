#!/bin/bash
clear
source color.sh
echo -e "${BLUE}*==== Which table U want to SELECTE FROM ! ====*${NC}"
read -r table_name

if [ -f "$table_name" ];then
	echo "*==== Table meta data ====*"
	awk 'BEGIN {FS=":"} {if(NR>0) printf $1"<"$2">\t\t"} END{printf "\n"}' $table_name.md
	echo "*==== Enter the WHERE CONDITION u want to select ====*"
	read -r pattern
	boy=$(sed -n "/$pattern/p" $table_name)
        if [[ -z $boy ]];then
		echo "Doesn't match any thing ... "
	else 
		sed -n "/$pattern/p" $table_name
	fi
	echo "press ENTER to back..."
	read 
else
	echo -e "${RED}*==== No table matched ====*${NC}"
	echo "For help use DISPLAY TABLES option To Know Your Tables And Come Again ✌"
	echo "press ENTER to back..."	
	read
fi
