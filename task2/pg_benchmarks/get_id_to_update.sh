#!/bin/bash

if [ $# != 1 ];
then
    echo 'Invalid arguments count'
    exit 1
fi

options+="--host=advanced-rds-pg.csx2xlwomohu.us-east-1.rds.amazonaws.com "
options+="--port=5432 "
options+="--dbname=homeworkdb "
options+="--user=postgres "
options+="--tuples-only "

tableName=$1;

read -r -d '' commandText<<sql
    select min(id)
    from $tableName
    where text_column is not null;
sql

psql $options --command "$commandText" | tr -d ' '

exit 0