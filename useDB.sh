#!/bin/bash

clear
cd /home/$USER/Desktop/databases
source color.sh
while true
do
	echo "*==== Enter Your Database Name To Use It , Please ====*"
	read -e dbname
	if [ -z "${dbname}" ];then
		echo -e "${RED}Your Database Name Cann't Be NULL${NC}"
	else
		break
	fi
done
if [ -d "${dbname}" ];then
	cd /home/$USER/Desktop/databases/$dbname
	echo "Now , Welcome back in Your Database $dbname 😎"	
	sleep 2
	source menu.sh
else
	echo "Sorry , No Database Found By This Name"
	sleep 1
	echo "BUt Don't Worry My Friend If You Forget Your Database Name I Will Help You By Two Choices 🧐"
	sleep 2
	echo "Show All Databases To Select From Them Or You Can Create Your Database Now Choose What Do You want 😉 "
	cd /home/$USER/Desktop/databases
	sleep 2
	select choice in "Show All Databases" "Create New Database" "Exit"
	do
		case $choice in
			"Show All Databases") echo "Your Databases : "
					echo 
					ls /home/$USER/Desktop/databases | cut -f1 -d" "
					echo					
					select choice in "Enter Your Database Name To Use It" "Back"
					do
						case $choice in 
							"Enter Your Database Name To Use It")
								cd /home/$USER/Desktop/databases
								echo "Enter Database name: "
								read Dbname
								if [ -d "${Dbname}" ];then
									cd /home/$USER/Desktop/databases/$Dbname
			 						echo "Now , Welcome back in Your Database ${Dbname} 😎"
									sleep 2	
									menu.sh;
								else 
									echo "You Select Wrong One Please Look closely And Don't Play 😠"
								fi;;
							Back) echo "Press enter to back.."
								break 1;;
							*) echo -e "${RED}$REPLY Is Not One Of The Choices , Please Do Not Play 😠${NC}" 
							   echo "Please, choose 1 OR 2 ..";;						
						esac
					done ;;
			"Create New Database") creatDB.sh
						break ;;
			Exit) break ;;
			*) echo -e "${RED}$REPLY Is Not One Of The Choices , Please Do Not Play 😠${NC}" ;;
		esac
	done
fi



