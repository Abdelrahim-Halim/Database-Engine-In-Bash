# !/bin/bash
function check_exist {
	if [ -f "$table_name" ]; then
		return 0;
  	else
		return 1;
  	fi
}

function validate_name {
	
	#empty
	if [ -z "$table_name" ] ; then
		echo "Table name can't be null"
		return 1;
	fi

	#spaces
	if [[ "$table_name" = *" "* ]]; then
		echo "Table name can't have spaces in between"
		return 1;
	fi

	#special characters
	if [[ "$table_name" = *['!'@#\$%^\&*()-+\.\/]* ]]; then
 		echo "Table name can't have special characters"
		return 1;
	fi

	#special characters
	if [[ "$table_name" = ['!'@#\$%^\&*()-+\.\/]* ]]; then
 		echo "Table name can't start special characters"
		return 1;
	fi
	
	#numbers
	if [[ "$table_name" = [0-9]* ]]; then
 		echo "Table name can't start with number"
		return 1;
	fi
	
	return 0;
}

read table_name;

while [[ true ]]
do
	#if the table is existed before then break the loop  
	if check_exist; then 
		echo "*=================================*"				
		echo "This table is allready exist.."
		echo "*=================================*"
		break;
	fi
        if validate_name; then
		#if the table is not existed before and have a vaild name 
		touch $table_name;
		touch $table_name.md;
		echo "*=================================*"				
		echo "Table created successfuly..."
		echo "*=================================*"			
		break;
	else 
		echo
		echo "*=================================*"
		echo "Use another name..."		
		echo
  		read table_name;
		validate_name;
    	fi
done


