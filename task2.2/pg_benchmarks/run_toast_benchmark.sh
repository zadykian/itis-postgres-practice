#!/bin/bash

# Function to generate random string of length '$1'
function generateRandomString()
{
	if [ $# != 1 ]; 
	then
		echo 'Invalid arguments count'
		exit 1
	fi

	local randomStringLength=$1
	cat /dev/urandom | tr -dc 'a-z0-9' | fold -w $randomStringLength | head -n 1
}

if [ $# != 2 ];
then
    echo 'Invalid arguments count'
    exit 1
fi

randomString=$(generateRandomString 3072)

options+="--host=advanced-rds-pg.csx2xlwomohu.us-east-1.rds.amazonaws.com "
options+="--port=5432 "
options+="--user=postgres "
options+="--file=$1 "
options+="--time=$2 "
options+="--no-vacuum "
options+="--define=text_value='$randomString'"

schemaName="task_2_2_toast"

for toastStrategy in "plain" "extended" "external" "main";
do
    tableName="${schemaName}.${toastStrategy}_strategy_table"
    pgbench $options --define=table_name=$tableName "homeworkdb"
done