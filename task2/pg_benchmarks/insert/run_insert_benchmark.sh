#!/bin/bash

if [ $# != 3 ];
then
    echo 'Invalid arguments count'
    exit 1
fi

options="--host=advanced-rds-pg.csx2xlwomohu.us-east-1.rds.amazonaws.com "
options+="--port=5432 "
options+="--user=postgres "
options+="--define=table_name=$1 "
options+="--time=$2 "
options+="--client=$3 "
options+="--file=insert_benchmark.sql "
options+="--no-vacuum "

options+="homeworkdb"

pgbench $options