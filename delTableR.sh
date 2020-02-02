#!/bin/bash
function check_exist {
	if [ -f "$table_name" ]; then
		return 0;
	else
		return 1;
  	fi
}
clear
echo "*==== Enter the table name ====*"
read -e table_name
if check_exist; then
	pk=$(awk 'BEGIN{FS=":"}{if(NR==1)print $1;}' $table_name.md)	
	echo "Your PK is : ${pk}"	
	while [[ true ]]
	do
		echo "Enter pk item to Delete Row"
		read item
		pkitem=$(awk -v items="$item" '{if($1==items){ print NR}}' $table_name )
		if [ -f $pkitem ];then 
			echo "*==== your pk item not right ====*"
		else
			break
		fi
	done
	sed -i "/$pkitem/d" $table_name;
	echo "row deleted"
	echo "Press Enter to Continue..."
	read
else
	echo "*==== This table is not exist! ====*"
	echo "Press Enter to Continue..."
	read
fi





