#!/bin/bash
function check_exist {
	if [ -f "$table_name" ]; then
		return 0;
	else
		return 1;
  	fi
}
table_name=$1
if check_exist; then
    while [[ true ]]
	do
	echo "*==== Enter the pk ====*"
	pkname=($(awk 'BEGIN{FS=":"}{if(NR==1)print $1;}' $table_name.md))
	read pk
if [ "$pkname" != "$pk" ]; then
	echo "*==== your pk not right ====*"
	
else
break
fi
done
while [[ true ]]
	do
	echo "Enter pk item to Delete Row"
	read item
	pkitem=$(awk -v items="$item" '{if($1==items){ print NR}}' $table_name )
	if [ -f $pkitem ] 
	then 
	echo "*==== your pk item not right ====*"
	
else
break
fi
done

 sed -i "/$pkitem/d" $table_name;
echo "row deleted"

else
	echo "*==== This table is not exist! ====*"
fi

