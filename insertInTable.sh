#!/bin/bash

stringReg="^[a-zA-Z]+[a-zA-Z]*$"
intReg="^[0-9]+[0-9]*$"
alphNumReg="^[a-zA-Z0-9_]*$"
source color.sh
function check_exist {
	if [ -f "$table_name" ]; then
		return 0;
	else
		return 1;
  	fi
}

function read_meta_data {
	columnsNumber=$( cat $table_name.md | wc -l )  
	columnsName=($(awk 'BEGIN{FS=":"}{if(NR>0)print $1;}' $table_name.md))
	columnsTyps=($(awk 'BEGIN{FS=":"}{if(NR>0)print $2;}' $table_name.md))
}

function check_repeated_pk {
	isFounded=1
	for field in $(cut -f1 -d: "$table_name"); do
		if [[ $field = "$1" ]]; then
			isFounded=0
			break
		fi
	done
	return $isFounded
}

function cheak_vaild_data {
	if [ -z "$data" ]; then
		echo -e "${RED}*==== ${columnsName[i]} can't be NULL ====*${NC}"
		return 0;
	else
		case ${columnsTyps[$1]} in
			Integer) 
				if [[ $data =~ $intReg ]]; then
					return 1;
				else
					echo -e "${YELLOW}*== ${columnsName[i]} only support Interger ==*${NC}"
					return 0;
				fi
				break ;;
			String)
				if [[ $data =~ $stringReg ]]; then
					return 1;
				else
					echo -e "${YELLOW}*== ${columnsName[i]} only support String ==*${NC}"
					return 0;
				fi
				break ;;
			AlphaNumeric)
				if [[ $data =~ $alphNumReg ]]; then
					return 1;
				else
					echo -e "${YELLOW}*== ${columnsName[i]} only support AlphaNumeric ==*${NC}"
					return 0;
				fi
				break ;;
		esac
	fi
}

function read_record {
	for (( i=0; i<$columnsNumber; i++ ))	
	do
		if (( $i==0 )); then
			echo -e "${BLUE}*==== ${columnsName[i]} using dataType:${columnsTyps[i]} ====*${NC}";	
			while [[ true ]]
			do
				read -r data;
				if check_repeated_pk $data; then
					echo -e "${YELLOW}*==== Sorry, this PK is used before ====*${NC}"
					echo "*==== Use another PK ====*"
				else
					if cheak_vaild_data $i; then
						echo "*==== Enter data again ====*"
					else
						#insert here
						record[$i]=$data
						break ;
					fi	
				fi
			done
		else
			echo -e "${BLUE}*==== ${columnsName[i]} using dataType:${columnsTyps[i]} ====*${NC}";
			while [[ true ]]
			do
				read -r data;
				if cheak_vaild_data $i; then
					echo "*==== Enter data again ====*"
				else
					#insert here
					record[$i]=$data
					break ;
				fi
			done		
		fi
	done
	echo ${record[*]} >> $table_name	
}

clear
echo "*==== Enter Table Name ====*"
read table_name
if check_exist; then
	read_meta_data
	echo "*==== Enter the record date ====*"
	read_record;
	echo -e "${GREEN}*==== Record inserted successfully ====*${NC}"
	while [[ true ]]
	do
		echo -e "${BLUE}*==== Do you want insert another record! ====*${NC}"
		select type in 'Yes' 'No'
		do
			case $REPLY in 
				1) read_record;
					sleep 1;
					echo -e "${GREEN}*==== Record inserted successfully ====*${NC}"
					break ;;
				2) break 2 ;; 
				*) echo "*==== Exit ====*";
					sleep 1;
					break 2 ;;
			esac
		done
	done	
else
	echo -e "${RED}*==== This table is not exist! ====*${NC}"
	echo "For help use DISPLAY TABLES option To Know Your Tables And Come Again ✌"
	echo "press ENTER to back..."	
	read
fi



