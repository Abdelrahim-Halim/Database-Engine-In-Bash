#!/bin/bash

if [ -f "$1" ];then
	echo "*==== Deleting $1 ====*"
	rm -r $1
	sleep 1;
	rm -r $1.md
	sleep 2;
	echo "*==== $1 is deleted ====*"
else
	echo "*==== There is no $1 table in Database $2 ====*"
fi
