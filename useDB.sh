#!/bin/bash

while true
do
echo "Enter Your Database Name To Use It , Please"
read dbname
cd /home/$USER/Desktop/databases
if [ -z "${dbname}" ]
then
echo " You Must Enter Your Database Name To Use It , Please"
else
break
fi
done
if [ -d "${dbname}" ]
then
cd /home/$USER/Desktop/databases/$dbname
echo "Now , Welcome back in Your Database $dbname 😎"
else
echo "Sorry , No Database Found By This Name"
sleep 1
echo "BUt Don't Worry My Friend If You Forget Your Database Name I Will Help You By Two Choices 🧐"
sleep 2
echo "Show All Databases To Select From Them Or You Can Create Your Database Now Choose What Do You want 😉 "
cd /home/$USER/Desktop/dbengine
sleep 2
select choice in "Show All Databases" "Create New Database" Exit
do
case $choice in
"Show All Databases") echo "Your Databases : " 
	ls /home/$USER/Desktop/databases
	select choice in "Enter Your Database Name To Use It" exit
	do
	case $choice in 
	"Enter Your Database Name To Use It")   cd /home/$USER/Desktop/databases
						read Dbname
						if [ -d "${Dbname}" ]
						then
						cd /home/$USER/Desktop/databases/$Dbname
			 			echo "Now , Welcome back in Your Database ${Dbname} 😎"	
						exit
						else 
						echo "You Select Wrong One Please Look closely And Don't Play 😠"
						fi
						
	;;
	exit) break
	;;
	*) echo "$REPLY Is Not One Of The Choices , Please Do Not Play 😠"
	;;
	esac
	done
	
;;
"Create New Database") cd /home/$USER/Desktop/dbengine 
			./creatDB.sh
exit
;;
Exit) exit
;;
*) echo "$REPLY Is Not One Of The Choices , Please Do Not Play 😠"
;;
esac
done
fi
