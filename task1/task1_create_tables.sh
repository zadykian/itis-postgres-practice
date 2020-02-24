#!/bin/bash
schema_name='advanced_rds_task1'

# recreate schema for test tables
psql -U postgres <<sql
	drop schema if exists $schema_name cascade; 
	create schema $schema_name;
sql

# create table for each TOAST strategy
for toast_strategy in 'plain' 'extended' 'external' 'main';
do
	table_name="${schema_name}.${toast_strategy}_table"
	column_name='text_column'

	psql -U postgres <<-sql
		create table $table_name 
		(
			$column_name varchar(4096) 
		);
		
		alter table $table_name 
		alter column $column_name 
		set storage $toast_strategy;
	sql
	
	# build SQL-script to insert 100 random string values of length 3072.
	#let insert_command = 'insert into $table_name ($column_name) values'
	#for i in {1..100};
	#do
	#	random_string = cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 3072 | head -n 1
	#	insert_command = $'$insert_command ('"'"'$random_string'"'"')'
	#done
	#insert_command = '$insert_command;'
	#echo $insert_command
	
	#psql -U postgres -c $insert_command
done

exit 0
