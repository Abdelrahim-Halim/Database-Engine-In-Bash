#!/bin/bash
clear
source color.sh
echo -e "${RED}Which table U want to DELETE !${NC}"
read table_name

if [ -f "$table_name" ];then
	echo "*==== Confirm DELETION! ====*"
	select type in 'Confirm' 'Dismiss'
	do
		case $REPLY in 
			1) echo -e "${RED}*==== Deleting $table_name ====*${NC}"
			   rm -r $table_name
			   sleep 1;
		           rm -r $table_name.md
			   sleep 1;
			   echo -e "${GREEN}*==== $table_name is deleted ====*${NC}"
			   echo "press ENTER to back..."	
			   read
			   break ;;
			2) break  ;; 
			*) echo "*==== Exit ====*";
			   echo "press ENTER to back..."	
			   read
				break ;;
		esac
	done
else
	echo -e "${RED}*==== No table matched ====*${NC}"
	echo "press ENTER to back..."	
	read
fi
