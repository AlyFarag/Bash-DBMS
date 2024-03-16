#! /bin/bash

clear

echo "*****************************************************"
echo "*                                                   *"

echo "*                 DBMS Bash Project                 *"

echo "*                                                   *"
echo "*****************************************************"
echo


echo "--------------- Available Tables ---------------"
echo

declare -a tables=(`ls $1/data`) 

select table in "${tables[@]}"
do
	if [[ "$REPLY" -lt 1 || "$REPLY" -gt "${#tables[@]}" ]]
	then
		echo "${REPLY} not in the menu"  
		continue
	else
		rm -r $1/data/${table}
		rm -r $1/meta/${table}
		
		echo "${tables[$REPLY-1]} table deleted successfully"
		break
	fi
done 

echo
echo "----------------------------------------------"
echo


 
echo
echo "-------------------------------------------------"
echo
source ./db_table.sh 
