#!/bin/bash

if [ $# != 2 ];
then
    echo 'Invalid arguments count'
    exit 1
fi

options+="--host=advanced-rds-pg.csx2xlwomohu.us-east-1.rds.amazonaws.com "
options+="--port=5432 "
options+="--user=postgres "
options+="--file=$1 "
options+="--time=$2 "
options+="--no-vacuum "

pgbench $options "homeworkdb"