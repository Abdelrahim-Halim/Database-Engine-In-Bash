#!/bin/bash
clear
source color.sh
echo -e "${BLUE}*==== Which table U want to SELETE FROM ! ====*${NC}"
read -r table_name

if [ -f "$table_name" ];then
	echo "*==== Table meta data ====*"
	awk 'BEGIN {FS=":"} {if(NR>0) printf $1"<"$2">\t\t"} END{printf "\n"}' $table_name.md
	echo "*==== Enter the pattern u want to select ====*"
	read -r pattern
	sed -n "/$pattern/p" $table_name
	echo "press ENTER to back..."
	read 
else
	echo -e "${RED}*==== No table matched ====*${NC}"
	sleep 1
	echo "press ENTER to back..."
	read 
fi
