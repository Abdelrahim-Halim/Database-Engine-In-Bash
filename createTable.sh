# !/bin/bash

source color.sh
english="^[a-zA-Z]+[a-zA-Z]*$"
function check_exist {
	if [ -f "$table_name" ]; then
		return 0;
  	else
		return 1;
  	fi
}

function validate_table_name {
	
	#empty
	if [ -z "$table_name" ] ; then
		echo -e "${RED}Table name can't be null${NC}"
		return 1;
	fi

	#spaces
	if [[ "$table_name" = *" "* ]]; then
		echo -e "${YELLOW}Table name can't have spaces in between${NC}"
		return 1;
	fi

	#special characters
	if [[ "$table_name" = *['!'@#\$%^\&*()'-'+'~'=\.\/]* ]]; then
 		echo -e "${YELLOW}Table name can't have special characters${NC}"
		return 1;
	fi

	#special characters
	if [[ "$table_name" = ['!'@#\$%^\&*()'-'+'~'=\.\/]* ]]; then
 		echo -e "${YELLOW}Table name can't start special characters${NC}"
		return 1;
	fi
	
	#numbers
	if [[ "$table_name" = [0-9]* ]]; then
 		echo -e "${YELLOW}Table name can't start with number${NC}"
		return 1;
	fi
	
	#English only
	if [[ $table_name =~ $english ]]; then
		return 0;
	else
 		echo -e "${YELLOW}column_name support English only${NC}"
		return 1
	fi

	return 0;
}

function validate_columns_number {
	#numbers
	if [[ $columns_number = [1-9] ]]; then
		return 0;
	fi
	if [[ $columns_number = [1-9][0-9]  ]]; then
		return 0;
	else				
		echo -e "${RED}Conflict, can't define nubmers of table columns! ...${NC}"
		return 1;
	fi
}

function read_columns_numbers {	
	echo "*==== Plz, enter columns_number ====*";
	read columns_number;

	while [[ true ]]
	do
		if validate_columns_number ; then
			#if validate_columns_number 
			break;
		else 
			echo "*==== Use another columns_number ====*"		
	  		read columns_number;
	    	fi
	done
}				

function check_column_name_exist {
	isExist=$(awk -v colName="$column_name" -F: 'BEGIN{isExist=0} {if($1==colName) {isExist=1}} END{print isExist}' $table_name.md);
	if [ $isExist -eq 1 ]; then
		return 1;
	else 
		return 0;
        fi
}

function validate_column_name {
	
	#empty
	if [ -z "$column_name" ] ; then
		echo -e "${RED}column_name can't be null${NC}"
		return 1;
	fi

	#spaces
	if [[ "$column_name" = *" "* ]]; then
		echo -e "${YELLOW}column_name can't have spaces in between${NC}"
		return 1;
	fi

	#special characters
	if [[ "$column_name" = *['!'@#\$%^\&*()'-'+'~'=\.\/]* ]]; then
 		echo -e "${YELLOW}column_name can't have special characters${NC}"
		return 1;
	fi

	#special characters
	if [[ "$column_name" = ['!'@#\$%^\&*()'-'+'~'=\.\/]* ]]; then
 		echo -e "${YELLOW}column_name can't start special characters${NC}"
		return 1;
	fi
	
	#numbers
	if [[ "$column_name" = [0-9]* ]]; then
 		echo -e "${YELLOW}column_name can't start with number${NC}"
		return 1;
	fi

	#English only
	if [[ $column_name =~ $english ]]; then
		return 0;
	else
 		echo -e "${YELLOW}column_name support English only${NC}"
		return 1
	fi
	
	return 0;	
}

function read_columns_names_and_types {
	for (( i=1; i<=$columns_number; i++ ))
	do
		if (( $i==1 )); then
			echo "*==== Enter the primary_key ====*";			
			while [[ true ]]
			do 
				read column_name;
				if check_column_name_exist; then
					if validate_column_name ;then
						break;
					else 					
						echo "*==== Use another PK name ====*"	 
					fi
				else
					echo -e "${RED}Conflict, column_name is exist! ...${NC}"
					echo "*==== Use another PK name ====*"
				fi
				
			done
			echo "*==== Choose primary_key_type ====*"
			validate_column_type $i;
			echo $column_name:$type >> $table_name.md
		else
			echo "*==== Enter column_name ====*";
			while [[ true ]]
			do 
				read column_name;
				if check_column_name_exist; then
					if validate_column_name ;then
						#if the column_name doesn't exist and valid then break
						break;
					else 					
						echo -e "${RED}Conflict, can't use this column name! ...${NC}"
						echo "*==== Use another column name ====*"	 
					fi
				else
					echo -e "${RED}Conflict, column_name is exist! ...${NC}"
					echo "*==== Use another column name ====*"
				fi
				
			done		
			echo "*==== Choose column_type ====*"
			validate_column_type $i;
			echo $column_name:$type >> $table_name.md 
		fi   	
	done
}

function validate_column_type {
	while [[ true ]]
	do
		select type in 'Integer' 'String' 'AlphaNumeric'
		do
			case $REPLY in 
				1) break 2 ;;
				2) break 2 ;;
				3) break 2 ;; 
				*) echo -e "${BLUE}Only support String, Integer and AlphaNumeric${NC}"
				echo "Use one of them..."
				break ;;
			esac
		done		
	done
}

function create_table {
	echo "*======== CREATE TABLE ========*"	
	echo "*==== Plz, enter table Name ====*"
	read table_name;
	while [[ true ]]
	do
		#if the table is existed before then break the loop  
		if check_exist; then 				
			echo -e "${RED}*==== This table is allready exist ====*${NC}"
			break;
		fi
        	if validate_table_name; then
			#if the table is not existed before and have a vaild name 
			touch $table_name;
			touch $table_name.md;				
			#insert Table metaData
			read_columns_numbers;
			read_columns_names_and_types ;
			echo -e "${GREEN}*==== Table created successfuly ====*${NC}"	
			break;
		else 
			echo "*==== Use another name ====*"
  			read table_name;
    		fi
	done
}

clear				
create_table;
while [[ true ]]
do
	echo "*==== Do you want create another table! ====*"
	select type in 'Yes' 'No'
	do
		case $REPLY in 
			1) clear; 
			   create_table;
				break ;;
			2) #menu
				break 2 ;; 
			*) echo "*==== Exit ====*";
				sleep 1;
				break 2 ;;
		esac
	done
done	


