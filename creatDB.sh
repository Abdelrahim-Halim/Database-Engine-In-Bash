#!/bin/bash
source color.sh
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
				if [[ "$dbname" = *['!'@#\$%^\&*()-+\.\/]* ]]; then
 					echo -e "${YELLOW}You Must Enter Your Database Name Without special characters${NC}"
				else
					#special characters
					if [[ "$dbname" = ['!'@#\$%^\&*()-+\.\/]* ]]; then
 						echo -e "${YELLOW}You Must Enter Your Database Name Without start special characters${NC}"
					else
						if [ -d "${dbname}" ];then
							echo -e "${RED}This Database Already Exist${NC}"
						else
							mkdir $dbname
							sleep 1
							echo -e "${GREEN}${dbname} DataBase Created Sucssesfully 😎${NC}"
							sleep 1
							break
						fi
					fi
				fi
			fi
		fi
	fi
done
