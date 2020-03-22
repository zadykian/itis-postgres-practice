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

options+="--host=advanced-rds-pg.csx2xlwomohu.us-east-1.rds.amazonaws.com "
options+="--port=5432 "
options+="--user=postgres "
options+="--no-vacuum "
options+="--file=$1 "
options+="$2 "

if [ $1 == "insert_benchmark.sql" ];
then
    randomString=$(generateRandomString 50)
    options+="--define=text_value='$randomString'"
fi

schemaName="task_2_3_fillfactor"

for fillfactorValue in 50 75 90 100;
do
	echo ""
	echo "fillfactor: ${fillfactorValue}%:"

    tableName="${schemaName}.table_${fillfactorValue}"
    pgbench $options --define=table_name=$tableName "homeworkdb"
done