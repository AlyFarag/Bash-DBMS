#! /bin/bash

#cd to DataBase directory to create new data base 
#cd ../DataBase

clear

echo "*****************************************************"
echo "*                                                   *"

echo "*                 DBMS Bash Project                 *"

echo "*                                                   *"
echo "*****************************************************"
echo


while true
do

#echo "hello from create data base bash script" 
#Ask the user for the data base name
read -p "Enter data base name : " dbName

case ${dbName} in
#Check if the user enter empty name
    "")  
        echo "Empty name, please enter the database name."
        continue
        ;;
#Check if the data base contain any special character or space [reverse the choice]
    *[!a-zA-Z0-9_]*)
        echo "Please use only letters and numbers."
        continue
        ;;
#Check if the data base name start with a number
    [0-9]*)
        echo "Database name cannot start with a number."
        continue
        ;;
#Valid data base name
    *)
        #echo "Valid database name."
        if [ -e ${dbName} ]
        then
        	echo "The Data base exists already, Try another name"
        	continue
        else
        	mkdir -p ../DataBase/${dbName}
        	mkdir -p ../DataBase/${dbName}/meta
        	mkdir -p ../DataBase/${dbName}/data
        	echo "The data base is created successfully."
        	break
        fi
        ;;
esac

done

source ./database.sh
echo

 
