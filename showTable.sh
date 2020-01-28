#!/bin/bash

if [ -f "$1" ];then	
	echo
	echo  "*=============== Table $1 ===============*"	
	awk 'BEGIN {FS=":"} {if(NR>0) printf $1"\t\t"} END{printf "\n"}' $1.md
	echo  "*========================================================================*"
	awk 'BEGIN{FS=" ";OFS="\t\t";ORS="\n";}{  $1=$1; print substr($0, 1, length($0))}' $1
	echo  "*========================================================================*"
	echo 
else
	echo "*==== There is no $1 table in Database $2 ====*"
fi
