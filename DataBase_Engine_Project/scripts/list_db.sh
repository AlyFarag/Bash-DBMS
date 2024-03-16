#! /bin/bash

clear

echo "*****************************************************"
echo "*                                                   *"

echo "*                 DBMS Bash Project                 *"

echo "*                                                   *"
echo "*****************************************************"
echo


#cd ../DataBase
echo "********     Existing data bases     ********"
echo
echo "----------------------------------------------"
echo
ls -F ../DataBase | tr / " "   #Transform / to space ,readability
echo
echo "----------------------------------------------"
echo
source ./database.sh
#cd -
