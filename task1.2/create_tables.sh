#!/bin/bash

if [ $# != 1 ];
then
	echo 'Invalid arguments count'
	exit 1
fi

rowsCount=$1
psqlOptions='--username postgres'
schemaName='advanced_rds_task1_2'

# Function to build and execute SQL-script 
# to insert 10000 random string values of length 50.
function insertStringValues()
{
	if [ $# != 2 ];
	then
		echo 'Invalid arguments count'
		exit 1
	fi

	local tableName=$1
	local columnName=$2
    local randomStringLength=50
	
	local insertCommand="insert into ${tableName} (${columnName}) values"
	for i in $(seq 1 $rowsCount);
	do
        local stringToInsert='abcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcde'
		insertCommand="${insertCommand} ('${stringToInsert}')"
		
		if [ $i != $rowsCount ];
		then
			insertCommand="${insertCommand},"
		fi
	done
	insertCommand="${insertCommand};"
	
	psql --username postgres <<-sql 
		$insertCommand 
	sql
}

# recreate schema for test tables
psql $psqlOptions postgres <<sql
	drop schema if exists $schemaName cascade; 
	create schema $schemaName;
sql

for fillfactorValue in 50 75 90 100;
do
    tableName="${schemaName}.fillfactor_${fillfactorValue}_table"
	textColumnName='varchar_column'

	psql $psqlOptions <<-sql
		create table $tableName 
		(
            number_column int,
			$textColumnName varchar(100),
            date_column date 
		)
        with (fillfactor = ${fillfactorValue});
	sql
	
	insertStringValues $tableName $textColumnName
done