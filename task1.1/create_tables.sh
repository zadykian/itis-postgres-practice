#!/bin/bash

# Function to generate random string of length '$1'
function generateRandomString()
{
	if [ $# != 0 ]; 
	then
		echo 'Invalid arguments count'
		exit 1
	fi

	randomStringLength=3072
	echo $(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w $randomStringLength | head -n 1)
}

# Function to build and execute SQL-script 
# to insert 100 random string values of length 3072.
function insertRandomStrings()
{
	if [ $# != 2 ];
	then
		echo 'Invalid arguments count'
		exit 1
	fi

	tableName=$1
	columnName=$2
	rowsCount=100
	
	insertCommand="insert into ${tableName} (${columnName}) values"
	for i in $(seq 1 $rowsCount);
	do
		randomString=$(generateRandomString)
		insertCommand="${insertCommand} ('${randomString}')"
		
		if [ $i != $rowsCount ];
		then
			insertCommand="${insertCommand},"
		fi
	done
	insertCommand="${insertCommand};"
	
	psql -U postgres <<-sql 
		$insertCommand 
	sql
}

schemaName='advanced_rds_task1'

# recreate schema for test tables
psql -U postgres <<sql
	drop schema if exists $schemaName cascade; 
	create schema $schemaName;
sql

# create table for each TOAST strategy
for toastStrategy in 'plain' 'extended' 'external' 'main';
do
	tableName="${schemaName}.${toastStrategy}_table"
	columnName='text_column'

	psql -U postgres <<-sql
		create table $tableName 
		(
			$columnName varchar(4096) 
		);
		
		alter table $tableName 
		alter column $columnName 
		set storage $toastStrategy;
	sql
	
	insertRandomStrings $tableName $columnName
done

exit 0
