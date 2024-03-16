#! /bin/bash

#Create user menu for Data Bases

#clear -x

echo "*****************************************************"
echo "*                                                   *"

echo "*                 DBMS Bash Project                 *"

echo "*                                                   *"
echo "*****************************************************"
echo
select choice in Create_DB List_DB Connect_DB Drop_DB Quit
do
case $choice in
Create_DB)
	#echo "Create"
	#run create data base script in the same bash shell 
	source ./create_db.sh
	;;
List_DB)
	#echo "List"
	source ./list_db.sh
	;;
Connect_DB)
	#echo "Connect"
	source ./connect_db.sh
	;;
Drop_DB)
	#echo "Drop"
	source ./drop_db.sh
	;;
Quit)
	exit
	;;		
*)
	echo "Wrong choice"
	;;
esac
done
