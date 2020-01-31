#!/bin/bash

while true
do

echo "Enter Your Database Name To Create It , Please"
read dbname
cd /home/$USER/Desktop/databases
if [ -z "${dbname}" ]
then
echo "You Must Enter Your Database Name To Create It , Please"
else
if [[ $dbname = [0-9]* ]]
then
echo "You Must Enter Your Database Name Not Start with Numbers"
else
if [[ $dbname = *[" "]* ]]
then
echo "You Must Enter Your Database Name Without Spaces"
else
if [ -d "${dbname}" ]
then
echo "This Database Already Exist"
else
mkdir $dbname
echo " ${dbname} DataBase Created Sucssesfully 😎"
break
fi
f
fi
fi
done
