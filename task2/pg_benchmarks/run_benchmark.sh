#!/bin/bash

if [ $# != 3 ];
then
    echo 'Invalid arguments count'
    exit 1
fi

options+="--host=advanced-rds-pg.csx2xlwomohu.us-east-1.rds.amazonaws.com "
options+="--port=5432 "
options+="--user=postgres "
options+="--file=$1 "
options+="--define=table_name=$2 "
options+="--time=$3 "
options+="--no-vacuum "

for clientCount in 1 4 8 16;
do
    echo ""
    pgbench --client $clientCount $options "homeworkdb"
done