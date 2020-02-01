#!/bin/bash

stringReg="^[a-zA-Z]+[a-zA-Z]*$"
intReg="^[0-9]+[0-9]*$"
alphNumReg="^[a-zA-Z0-9_]*$"
function check_exist {
	if [ -f "$table_name" ]; then
		return 0;
	else
		return 1;
  	fi
}

function check_repeated_pk {
	isFounded=1
	for field in $(cut -f1 -d: "$table_name") 
	do
		if [[ $field = "$1" ]]
		then
			isFounded=0
			break
		fi
	done
	return $isFounded
}
function cheak_vaild_data {

    if [ $1 == "Integer" ] 
    then 
    
        if [[ $2 =~ $intReg ]] 
        then  
        return 1
        else 
        return 0
        fi
    elif [ $1 == "String" ]
    then
        if [[ $2 =~ $stringReg ]]
        then
        return 1
        else
        return 0
        fi
    elif [ $1 == "AlphaNumeric" ]
    then
        if [[ $2 =~ $alphNumReg ]]
        then
        return 1
        else
        return 0
        fi
    
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
	echo "enter pk item to search"
	read item
	pkitem=$(awk -v items="$item" '{if($1==items){ print NR}}' $table_name )
	if [ -f $pkitem ] 
	then 
	echo "*==== your pk item not right ====*"
	
else
break
fi
done
	rn=$(awk -v items="$item" '{if($1==items){ print NR}}' $table_name )
	echo "enter col name"
	read colname

	cn=$(awk -F: '{if($1=="'$colname'"){print NR}}' $table_name.md)
	echo $cn
	if [ -f $cn ] ;then 

	echo "*==== your colname not right ====*"
	exit
else
	echo "enter col item to update"
	read newdata
	if [ -z "$newdata" ]; then
	echo "*==== ${newdata} can't be NULL ====*"
	else
	if [ $colname == $pkname ]
 then

	check_repeated_pk $newdata
    if [[ $? == 0 ]]
    then
        echo "this is repeated pk"
        exit
    fi
    fi
	
	columnsTyps=($(awk -v colNumber="$cn" 'BEGIN{FS=":"}{if(NR==colNumber)print $2;}' $table_name.md))
    cheak_vaild_data $columnsTyps $newdata;
    if [[ $? == 0 ]] 
    then
    echo "Column Type Not Right"
    else
    
	awk -v rowNumber="$rn" -v colNumber="$cn" -v newData="$newdata" '{if(NR == rowNumber){$colNumber = newData};print $0;}' $table_name >> $table_name.new;
	mv $table_name.new $table_name
fi
fi
fi	
else
	echo "*==== This table is not exist! ====*"
fi

