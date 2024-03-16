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
		#Get the number of fielsd 
		colsNum=`awk 'END{print NF}' $1/meta/${tables[$REPLY-1]}`
		echo "Number of fields : $colsNum"
		#Print the field name and data type
		#fieldsArrName=( `awk  $1/meta/${tables[$REPLY-1]}` )
		fieldsArrName=( `head -n 1 $1/meta/${tables[$REPLY-1]}` )
		echo ${fieldsArrName[@]}
		
		#fieldsArrType=( `awk 'END{print NR,$0}' $1/meta/${tables[$REPLY-1]}` )
		fieldsArrType=( `tail -n -1 $1/meta/${tables[$REPLY-1]}` )
		echo ${fieldsArrType[@]}
		#echo "${tables[$REPLY-1]} table deleted successfully"
		
		break
	fi
done 

echo
echo "----------------------------------------------"
echo

###########################################################################################
#Ask the user to enter pk data to the table
data=""
data_type=""
insert_data=""

while true
do 
data="${fieldsArrName[0]}"
data_type="${fieldsArrType[0]}"
echo "Inserting data ( '$data' ) of type ( '$data_type' ) into table : "
read -p "Enter the column data ( "${fieldsArrName[0]}" ) : " user_data

#Check the constranits for the inserted data
if [[ ${user_data} =~ ^[0-9]+$ ]] #start with a number and end with a number
   then
        user_data_type="number"
   else
        user_data_type="string"
fi

if [[ ${user_data_type} = ${data_type} ]]
then
	echo "valid data"
	# -v path var to awk command , $1 == data check if the first column exist or not
	found=$(awk -v user_data="$user_data" 'BEGIN{FS=" "} $1 == user_data {print "exist"}' "$1/data/${tables[$REPLY-1]}")
	if [[ ${found} = "exist" ]]
	then
		echo "Duplicate data."
		continue
	else
		insert_data+="${user_data}"
		break
		
	fi
	else
	echo "invalliiiiiiid"
	continue
fi
done

insert_data+=" "
###########################################################################################

#Ask the user to enter data to the table

for ((i=1; i<"${#fieldsArrType[@]}";i++))
do 

while true 
do
data="${fieldsArrName[i]}"
data_type="${fieldsArrType[i]}"
echo "Inserting data ( '$data' ) of type ( '$data_type' ) into table : "
read -p "Enter the column data ( "${fieldsArrName[i]}" ) : " user_data

#Check the constranits for the inserted data
if [[ ${user_data} =~ ^[0-9]+$ ]] #start with a number and end with a number
   then
        user_data_type="number"
   else
        user_data_type="string"
fi

if [[ ${user_data_type} = ${data_type} ]]
then
	echo "valid data"
	insert_data+="${user_data}"
	break
	else
	echo "invalliiiiiiid"
	continue
fi

done

insert_data+=" "

done


echo ${insert_data} >> "$1/data/${tables[$REPLY-1]}"

 
echo
echo "-------------------------------------------------"
echo
source ./db_table.sh

