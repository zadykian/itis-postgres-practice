#!/bin/bash

if [ $# != 1 ];
then
    echo 'Invalid arguments count'
    exit 1
fi

options+="--host=advanced-rds-pg.csx2xlwomohu.us-east-1.rds.amazonaws.com "
options+="--port=5432 "
options+="--user=postgres "
options+="--file=update_single_row.sql "
options+="--no-vacuum "
options+="--client=32 "
options+="--jobs=4 "
options+="--transactions=$1"

pgbench $options "homeworkdb"