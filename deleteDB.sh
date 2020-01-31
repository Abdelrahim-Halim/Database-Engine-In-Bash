#!/bin/bash

while true
do
echo "Enter Your Database Name To Delete It"
read dbname
cd /home/$USER/Desktop/databases
if [ -z "${dbname}" ]
then
echo -e "You Must Enter Your Database Name \n "
else
break
fi
done
if [ -d "${dbname}" ]
then
rm -r $dbname
echo "${dbname} Database deleted sucssesfully 😎"
else
echo "No Database Found , Bye"
fi
