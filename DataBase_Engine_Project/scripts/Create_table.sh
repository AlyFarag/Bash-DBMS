#! /bin/bash

clear

# Enable extended globbing to use numbers regex
shopt -s extglob

echo "*****************************************************"
echo "*                                                   *"

echo "*                 DBMS Bash Project                 *"

echo "*                                                   *"
echo "*****************************************************"
echo



#step 1: list all tables to user

#echo "**************  Existing Tables  **************"
#ls -s $1 # -s used to list all files

#step 2: Ask user to enter the table name

while true
do
read -p "Enter table name : " tableName

case ${tableName} in
    "")
        echo "Empty name, please enter the table name."
        continue
        ;;
    *[!a-zA-Z0-9_]*)
        echo "Please use only letters and numbers."
        continue
        ;;
    [0-9]*)
        echo "Database table name cannot start with a number."
        continue
        ;;
    *)
        echo "Valid table name."
        if [ -e $1/${tableName} ]
        then
        	echo "The table exists already, Try another name"
        	continue
        else
        	touch $1/meta/${tableName}
        	touch $1/data/${tableName}
        	echo "The data base table is created successfully."
        	break
        fi
        ;;
esac

done

#step 3: Ask the user about number of metadata 'number of columns and data types and pk used'

while true
do
read -p "Enter number of column for table ( ${tableName} ) : " numOfColumn

case ${numOfColumn} in
    "")
        echo "Empty number, please enter the table columns number."
        continue
        ;;
    [0]*)
        echo "Columns number can't be zero."
        continue
        ;;
    +([1-9]) | *([1-9]*[0-9]))
        echo "The table number of clumns ${numOfColumn}."
        break;
        ;;
    *)
        echo "Invalid column number."
        continue
        ;;
esac

done

echo


#Get the columns name and data type for each column

let fields_num=${numOfColumn}
echo "
*********************   Insert meta-data for table ${tableName}  ***************************
"
echo

colMetaDataName=""
colMetaDataType=""

#Ask user to enter the primary key
while true
do

read -p "Enter primary key name : " colName
case ${colName} in
    "")
        echo "Empty name, please enter the column name."
        continue
        ;;
    *[!a-zA-Z0-9_]*)
        echo "Please use only letters and numbers."
        continue
        ;;
    [0-9]*)
        echo "Database table column name cannot start with a number."
        continue
        ;;
    *)
        echo "Valid column name."
        break
        ;;
esac
done
#End the loop for column name

#colMetaData+="${colName}"

#Start for the loop for column data type
while true
do

read -p "Choose primary key datatype String(s) Number(n)-> (s/n) : " colDataType
echo
case "$colDataType" in
     "s" | "S" ) 
        colMetaDataName+="${colName}"
        colMetaDataType+="string"
        break
        ;;
     "n" | "N" ) 
        colMetaDataName+="${colName}"
        colMetaDataType+="number"
        break
         ;;
* ) 
	echo "Invalid option $REPLY"
	continue
	;;
esac

done
#printf "$colMetaData | " >> "$1/${tableName}.meta"

echo 
colMetaDataName+=" "
colMetaDataType+=" "

for(( i=1;i<${fields_num};i++ ))
do


#Start for the loop for column name
while true
do

read -p "Enter column ${i} name : " colName
case ${colName} in
    "")
        echo "Empty name, please enter the column name."
        continue
        ;;
    *[!a-zA-Z0-9_]*)
        echo "Please use only letters and numbers."
        continue
        ;;
    [0-9]*)
        echo "Database table column name cannot start with a number."
        continue
        ;;
    *)
        echo "Valid column name."
        break
        ;;
esac
done
#End the loop for column name

#colMetaData=${colName}

#Start for the loop for column data type
while true
do

read -p "Choose column ${i} datatype String(s) Number(n)-> (s/n) : " colDataType
echo
case "$colDataType" in
     "s" | "S" ) 
        colMetaDataName+="${colName}"
        colMetaDataType+="string"
        break
        ;;
     "n" | "N" ) 
        colMetaDataName+="${colName}"
        colMetaDataType+="number"
        break
         ;;
* ) 
	echo "Invalid option $REPLY"
	continue
	;;
esac
done

colMetaDataName+=" "
colMetaDataType+=" "
done
#End the loop for column data type
echo "$colMetaDataName" >> "$1/meta/${tableName}"
echo "$colMetaDataType" >> "$1/meta/${tableName}"


echo 
echo ${colMetaDataName}
echo ${colMetaDataType}
#after completing making directry - mean to go back the previous directory 

echo
source ./db_table.sh 
