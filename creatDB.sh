#!/bin/bash
source color.sh
english="^[a-zA-Z]+[a-zA-Z]*$"
clear
while true
do
	echo "*==== Enter Your Database Name To Create It , Please ====*"
	read dbname
	cd /home/$USER/Desktop/databases
	if [ -z "${dbname}" ];then
		echo -e "${RED}Your Database Name Can't Be NULL${NC}"
	else
		if [[ $dbname = [0-9]* ]];then
			echo -e "${YELLOW}You Must Enter Your Database Name Not Start with Numbers${NC}"
		else
			if [[ $dbname = *[" "]* ]];then
				echo -e "${YELLOW}You Must Enter Your Database Name Without Spaces${NC}"
			else
				#special characters
				if [[ "$dbname" = *['!'@#\$%^\&*()'-'+'~'=\.\/]* ]]; then
 					echo -e "${YELLOW}You Must Enter Your Database Name Without special characters${NC}"
				else
					#special characters
					if [[ "$dbname" = ['!'@#\$%^\&*()'-'+'~'=\.\/]* ]]; then
 						echo -e "${YELLOW}You Must Enter Your Database Name Without start special characters${NC}"
					else
						if [ -d "${dbname}" ];then
							echo -e "${RED}This Database Already Exist${NC}"
						else
							#English only
							if [[ $dbname =~ $english ]]; then
								mkdir $dbname
								sleep 1
								echo -e "${GREEN}${dbname} DataBase Created Sucssesfully 😎${NC}"
								sleep 1
								break
							else
 								echo -e "${YELLOW}column_name support English only${NC}"
							fi		
						fi
					fi
				fi
			fi
		fi
	fi
done
