# !/bin/bash
read table_name
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
		echo "Enter Table Name"
	fi

	#spaces
	if [[ "$table_name" = *" "* ]]; then
		echo "Spaces Are Not Allowed!"
	fi

	#special characters
	if [[ "$table_name" = *['!'@#\$%^\&*()-+\.\/]* ]]; then
 		echo "It contains one of those"
	fi
	
	#numbers
	if [[ "$table_name" = [0-9]* ]]; then
 		echo "cannot start with number"
	fi
	
		

}

validate_name 
check_exist
