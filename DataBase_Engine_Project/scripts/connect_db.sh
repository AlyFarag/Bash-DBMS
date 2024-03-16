#! /bin/bash

clear

echo "*****************************************************"
echo "*                                                   *"

echo "*                 DBMS Bash Project                 *"

echo "*                                                   *"
echo "*****************************************************"
echo

echo "Choose the data base number to connect with: "
echo

echo "----------------------------------------------"
echo

declare -a databases=(`ls -F ../DataBase | tr / " "`)   #Transform / to space ,readability

#echo ${#databases[@]}

select choice in "${databases[@]}"
do
	if [[ "$REPLY" -lt 1 || "$REPLY" -gt "${#databases[@]}" ]]
	then
		echo "${REPLY} not in the menu"  
		continue
	else
		cd ../DataBase/${databases[$REPLY-1]}
		echo "You are now connected to ${databases[$REPLY-1]} data base"
		break
	fi
done 

echo
echo "----------------------------------------------"
echo

#back to the scripts directory
cd ../../scripts

#Run the table menu for the connected data base , path it as an argument
source ./db_table.sh ../DataBase/${databases[$REPLY-1]}



