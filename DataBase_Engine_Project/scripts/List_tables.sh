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

ls $1/data #| awk 'BEGIN{FS="."}{ print $1 }'
 
echo
echo "-------------------------------------------------"
echo
source ./db_table.sh 
