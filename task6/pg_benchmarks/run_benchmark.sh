#!/bin/bash

if [ $# != 0 ];
then
    echo 'Invalid arguments count'
    exit 1
fi

options+="--host=advanced-rds-pg.csx2xlwomohu.us-east-1.rds.amazonaws.com "
options+="--port=5432 "
options+="--user=postgres "
options+="--file=update_hub_table.sql "
options+="--transactions=1000000 "
options+="--no-vacuum "

pgbench $options "homeworkdb"