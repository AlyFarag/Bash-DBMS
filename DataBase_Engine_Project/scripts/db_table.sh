#! /bin/bash

#clear

echo "*****************************************************"
echo "*                                                   *"

echo "*                 DBMS Bash Project                 *"

echo "*                                                   *"
echo "*****************************************************"
echo 


#Create user menu for Data Bases
select choice in Create_table Drop_table List_tables insert_in_table select_from_table Delete_from_table Update_from_table main_menu
do
case $choice in
Create_table)
	#echo "Create_table"
	#run create data base script in the same bash shell 
	source ./Create_table.sh $1
	;;
Drop_table)
	#echo "Drop_table"
	#run create data base script in the same bash shell 
	source ./Drop_table.sh $1
	;;
List_tables)
	#echo "List_tables"  
	#run create data base script in the same bash shell 
	source ./List_tables.sh $1
	;;
insert_in_table)
	echo "insert_in_table"
	#run create data base script in the same bash shell 
	source ./insert_in_table.sh $1
	;;
select_from_table)
	echo "select_from_table"
	#run create data base script in the same bash shell 
	source ./select_from_table.sh $1
	;;
Delete_from_table)
	echo "Delete_from_table"
	#run create data base script in the same bash shell 
	source ./Delete_from_table.sh $1
	;;
Update_from_table)
	echo "Update_from_table"
	#run create data base script in the same bash shell 
	source ./Update_from_table.sh $1
	;;
main_menu)
	source ./database.sh
	;;		
*)
	echo "Wrong choice"
	;;
esac
done
