#! /bin/bash

clear

echo "*****************************************************"
echo "*                                                   *"

echo "*                 DBMS Bash Project                 *"

echo "*                                                   *"
echo "*****************************************************"
echo


echo "********     Existing data bases     ********"
echo
echo "----------------------------------------------"
echo

#cd ../DataBase
declare -a databases=(`ls -F ../DataBase | tr / " "`)   #Transform / to space ,readability
#echo ${databases[@]}
echo

select choice in "${databases[@]}"
do
	if [[ "$REPLY" -lt 1 || "$REPLY" -gt "${#databases[@]}" ]]
	then
		echo "${REPLY} not in the menu"  
		continue
	else
		rm -r ../DataBase/${databases[$REPLY-1]}
		echo " ${databases[$REPLY-1]} data base deleted successfully"
		break
	fi
done 

echo
echo "----------------------------------------------"
echo

source ./database.sh

