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


table_file="$1/data/${tables[$REPLY-1]}"
	echo $table_file

echo "Select menu"
echo
select option in all col
do
case $option in
all)
	cat $1/meta/${tables[$REPLY-1]}
	echo "-----------------------------------------------"
	cat "$1/data/${tables[$REPLY-1]}"
	
	break
	;;
col)	
	echo "Enter search data : "
	read user_data	
	
 	# Check if the table file exists

	if [[ -f "$table_file" ]] 
	then
    		found=$(awk -v user_data="$user_data" '{ if ($1 == user_data) print "exist" }' "$table_file")
    		#printh=$(awk '{if ( $1 == 2 ){print "exist"}}' "$table_file") 
    		#echo $printh
    		echo "${found}"
    		if [[ "${found}" = "exist" ]]
    		then
    		echo
        	searchData=$(awk -v user_data="$user_data" '{ if ($1 == user_data) print $0}' "$table_file")
        	echo $searchData
    		else
        	echo "No data found."
    		fi
	else
    		echo "Error: Table file '$table_file' does not exist."
	fi	
	break
	;;	
*)
	echo "invaliiiiiiiiiiiid"
	continue
	;;
esac

done

echo
echo "-------------------------------------------------"
echo
source ./db_table.sh



