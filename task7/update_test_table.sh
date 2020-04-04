#!/bin/bash

if [ $# != 1 ];
then
    echo 'Invalid arguments count'
    exit 1
fi

options+="--host=advanced-rds-pg.csx2xlwomohu.us-east-1.rds.amazonaws.com "
options+="--port=5432 "
options+="--username=postgres "
options+="--no-password "
options+="--dbname=homeworkdb "
options+="--single-transaction"

read -r -d '' commandText <<sql
    update task_7.vacuum_test
    set name = concat(left(name, 9), ' ', current_iteration)
sql

for iteration in $(seq 1, 1000000);
do
    psql $options --command "${commandText//current_iteration/$iteration}"
done